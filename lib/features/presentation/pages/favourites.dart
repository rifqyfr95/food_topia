import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_topia/injection_container.dart' as di;
import 'package:food_topia/features/presentation/bloc/meals_data_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_topia/app_module.dart';
import 'package:food_topia/features/presentation/widget/loading_widget.dart';
import 'package:food_topia/features/presentation/widget/meals_list_view.dart';
import 'package:food_topia/features/presentation/widget/message_display.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodFavouritesPage extends StatefulWidget {
  FoodFavouritesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FoodFavouritesPageState createState() => _FoodFavouritesPageState();
}

class _FoodFavouritesPageState extends State<FoodFavouritesPage> {
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        leading: InkWell(
          child: IconButton(
            onPressed: () {
              Modular.to.navigate("/", arguments: "Foodtopia");
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: buildBody(context),
        ),
      ),
    );
  }

  BlocProvider<MealsDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<MealsDataBloc>(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<MealsDataBloc, MealsDataState>(
            builder: (context, state) {
              if (state is Empty) {
                dispatchListMealsWithoutFavourites(context);
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: Text('Start loading!'),
                  ),
                );
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is ListLoaded) {
                return MealListView(state.meals, 2);
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  void dispatchListMeals(BuildContext context) {
    BlocProvider.of<MealsDataBloc>(context).add(GetMealsForData());
  }

  void dispatchListMealsWithoutFavourites(BuildContext context) {
    BlocProvider.of<MealsDataBloc>(context)
        .add(UpdateMealsDataForWithoutFavourites());
  }

  loadSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    loadSharedPref();
    super.initState();
  }
}

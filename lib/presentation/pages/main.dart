import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_topia/injection_container.dart' as di;
import 'package:food_topia/presentation/bloc/meals_data_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_topia/app_module.dart';
import 'package:food_topia/presentation/widget/loading_widget.dart';
import 'package:food_topia/presentation/widget/meals_list_view.dart';
import 'package:food_topia/presentation/widget/message_display.dart';

void main() async {
  await di.init();
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      title: 'Foodtopia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodListPage(title: 'Foodtopia'),
    ).modular();
  }
}

class FoodListPage extends StatefulWidget {
  FoodListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<MealsDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<MealsDataBloc>(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'List of meal',
          ),
          BlocBuilder<MealsDataBloc, MealsDataState>(
            builder: (context, state) {
              if (state is Empty) {
                dispatchListMeals(context);
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: Text('Start loading!'),
                  ),
                );
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is ListLoaded) {
                return MealsListView(state.meals);
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

  @override
  void initState() {
    super.initState();
  }
}






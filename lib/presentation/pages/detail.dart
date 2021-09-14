import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/injection_container.dart' as di;
import 'package:food_topia/presentation/bloc/meals_data_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_topia/presentation/widget/loading_widget.dart';
import 'package:food_topia/presentation/widget/meals_view.dart';
import 'package:food_topia/presentation/widget/message_display.dart';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage(this.data);
  MealsData data;

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodtopia"),
        elevation: 0,
        leading: InkWell(
          child: IconButton(
            onPressed: () {
              Modular.to.navigate("/",arguments: "Foodtopia");
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
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
          BlocBuilder<MealsDataBloc, MealsDataState>(
            builder: (context, state) {
              if (state is Empty) {
                dispatchGetMealsDetails(context);
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: Text('Loading food detail!'),
                  ),
                );
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return MealsView(state.meals);
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

  void dispatchGetMealsDetails(BuildContext context) {
    print("id : ${widget.data.mealsId}");
    BlocProvider.of<MealsDataBloc>(context).add(GetMealsDataForById(widget.data.mealsId));
  }

  @override
  void initState() {
    super.initState();
  }
}




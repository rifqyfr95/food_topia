import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/presentation/bloc/meals_data_bloc.dart';

class MealsView extends StatefulWidget {
  MealsView(this.mealsData);

  MealsData mealsData;

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              widget.mealsData.mealsPictURL,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.orangeAccent),
                child: Text(
                  widget.mealsData.mealsName,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,),
                  maxLines: 2,
                ),
              ),
              IconButton(onPressed: () {
                dispatchChangeFavourites();
                Future.delayed(Duration(milliseconds: 700)).then((value) {
                  setState(() {

                  });
                });
              }, icon: Icon(Icons.thumb_up,color: widget.mealsData.mealsFavourite == 1 ? Colors.orange:Colors.grey,)),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Visibility(
              visible: widget.mealsData.mealsTags.isNotEmpty,
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.yellow),
                child: Text(widget.mealsData.mealsTags,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              )),
          SizedBox(
            height: 15.0,
          ),
          Text("Instruction",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white),
            child: Text(widget.mealsData.mealsInstructions,
                style: TextStyle(color: Color(0xAA000000), fontSize: 18.0)),
          ),
        ],
      ),
    );
  }
  void dispatchChangeFavourites() {
    if (widget.mealsData.mealsFavourite == 0){
      widget.mealsData.mealsFavourite = 1;
    }else{
      widget.mealsData.mealsFavourite = 0;
    }
    BlocProvider.of<MealsDataBloc>(context)
        .add(UpdateMealsDataForById(widget.mealsData.mealsId, widget.mealsData.mealsFavourite));
  }
}

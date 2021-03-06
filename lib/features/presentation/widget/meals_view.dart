import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_topia/features/presentation/bloc/meals_data_bloc.dart';

class MealsView extends StatefulWidget {
  MealsView(this.mealsId, this.mealsName, this.mealsPictURL, this.mealsTags, this.mealsDesc, this.mealsFavourite);

  String mealsId;
  String mealsName;
  String mealsPictURL;
  String mealsTags;
  String mealsDesc;
  int mealsFavourite;

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
              widget.mealsPictURL,
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
                  widget.mealsName,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,),
                  maxLines: 2,
                ),
              ),
              IconButton(onPressed: () {
                if(mounted){
                  dispatchChangeFavourites();
                  Future.delayed(Duration(milliseconds: 700)).then((value) {
                    setState(() {

                    });
                  });
                }
              }, icon: Icon(Icons.star,color: widget.mealsFavourite == 1 ? Colors.orange:Colors.grey,)),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Visibility(
              visible: widget.mealsTags.isNotEmpty,
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.yellow),
                child: Text(widget.mealsTags,
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
            child: Text(widget.mealsDesc,
                style: TextStyle(color: Color(0xAA000000), fontSize: 18.0)),
          ),
        ],
      ),
    );
  }
  void dispatchChangeFavourites() {
    if (widget.mealsFavourite == 0){
      widget.mealsFavourite = 1;
    }else{
      widget.mealsFavourite = 0;
    }
    BlocProvider.of<MealsDataBloc>(context)
        .add(UpdateMealsDataForById(widget.mealsId, widget.mealsFavourite));
  }
}

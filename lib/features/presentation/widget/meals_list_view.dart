import 'package:flutter/material.dart';
import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_topia/features/presentation/bloc/meals_data_bloc.dart';

class MealListView extends StatefulWidget {

  MealListView(this.mealsData, this.type);

  List<MealsData> mealsData;
  int type;

  @override
  _MealsListViewState createState() => _MealsListViewState();

}
class _MealsListViewState extends State<MealListView> {

  @override
  Widget build(BuildContext context) {
    List<MealsData> data = [];
    data.forEach((element) {
      if(element.mealsFavourite == 1){
        data.add(element);
      }
    });
    if(widget.type==1){
     data.addAll(widget.mealsData);
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.blueAccent),
          child: ListTile(
              title: Text(
                data[index].mealsName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0),
              ),
              subtitle: Text(
                data[index].mealsTags,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  data[index].mealsPictURL,
                ),
              ),
              onTap: () {
                if (widget.type == 1) {
                  Modular.to.navigate('/detail', arguments: data[index]);
                }
              },
              trailing: widget.type == 1 ? Container(height: 10, width: 10,):SizedBox(
                width: 30,
                height: 30,
                child: InkWell(
                  onTap: () {
                    if(mounted){
                      dispatchChangeFavourites(data,index);
                      Future.delayed(Duration(milliseconds: 700)).then((value) {
                        setState(() {

                        });
                      });
                    }
                  },
                  child: Icon(
                    Icons.star,
                    color: data[index].mealsFavourite == 1
                        ? Colors.orange
                        : Colors.grey,
                    size: 16.0,
                  ),
                ),
              )),
        );
      },
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
  void dispatchChangeFavourites(List<MealsData> data, int index) {
    if (data[index].mealsFavourite == 0){
      data[index].mealsFavourite = 1;
    }else{
      data[index].mealsFavourite = 0;
    }
    BlocProvider.of<MealsDataBloc>(context)
        .add(UpdateMealsDataForById(data[index].mealsId, data[index].mealsFavourite));
  }
}

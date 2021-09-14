import 'package:flutter/material.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MealsListView extends StatelessWidget {
  final List<MealsData> mealsData;

  const MealsListView(
      this.mealsData,
      ) : assert(mealsData != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.blueAccent),
          child: ListTile(
            title: Text(mealsData[index].mealsName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20.0),),
            subtitle: Text(mealsData[index].mealsTags, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15.0),),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                mealsData[index].mealsPictURL,
              ),
            ),
            onTap: (){
              Modular.to.navigate('/detail',arguments: mealsData[index]);
            },
          ),
        );
      },
      itemCount: mealsData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
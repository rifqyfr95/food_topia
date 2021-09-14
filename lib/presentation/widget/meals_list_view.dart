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
        return ListTile(
          title: Text(mealsData[index].mealsName),
          subtitle: Text(mealsData[index].mealsTags),
          leading: Image.network(mealsData[index].mealsPictURL),
          onTap: (){
            Modular.to.navigate('/detail',arguments: mealsData[index]);
          },
        );
      },
      itemCount: mealsData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
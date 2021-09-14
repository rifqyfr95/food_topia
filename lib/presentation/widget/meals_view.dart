import 'package:flutter/material.dart';
import 'package:food_topia/domain/entities/meals_data.dart';

class MealsView extends StatelessWidget {
  final MealsData mealsData;

  const MealsView(
      this.mealsData,
      ) : assert(mealsData != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            mealsData.mealsName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 34.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mealsData.mealsTags,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
              mealsData.mealsInstructions,
              style: TextStyle(color: Colors.black, fontSize: 18.0)),

        ],
      ),
    );
  }
}
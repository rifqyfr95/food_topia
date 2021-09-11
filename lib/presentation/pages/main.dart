import 'package:flutter/material.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodtopia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodListPage(title: 'Foodtopia'),
    );
  }
}

class FoodListPage extends StatefulWidget {
  FoodListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<List<MealsData>> getData() async {
    List<MealsData> result = [];
    String base_url = "https://www.themealdb.com/api/json/v1/1/search.php?f=b";
    var datas = await http.get(Uri.parse(base_url));
    var dataBodies = json.decode(datas.body);
    List<dynamic> meals = dataBodies['meals'];
    meals.forEach((element) {
      MealsData mealsData = MealsData(mealsName: element['strMeal'], mealsPictURL: element['strMealThumb'], mealsTags: element['strTags'] ?? "", mealsInstructions: element['strInstructions']);
      result.add(mealsData);
      if (result.length == 20) {
        return;
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'List of meal',
            ),
            FutureBuilder(
              initialData: List<MealsData>.empty(),
                builder: (context, AsyncSnapshot<List<MealsData>> snapShotData) {
              if (snapShotData.connectionState == ConnectionState.done &&
                  snapShotData.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapShotData.data?.length,
                  itemBuilder: (context, index) {
                    print(snapShotData.data);
                    return ListTile(
                      title: Text(snapShotData.data![index].mealsName),
                      subtitle: Text(snapShotData.data![index].mealsTags),
                      leading: Image.network(snapShotData.data![index].mealsPictURL),
                    );
                  },
                );
              }
              return Container();
            },
            future: getData(),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
}

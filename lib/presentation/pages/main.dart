import 'package:flutter/material.dart';
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

  Future<List<String>> getData() async {
    List<String> result = [];
    String base_url = "https://www.themealdb.com/api/json/v1/1/search.php?f=b";
    var datas = await http.get(Uri.parse(base_url));
    var dataBodies = json.decode(datas.body);
    List<dynamic> meals = dataBodies['meals'];
    for (var dataMeals in meals) {
      result.add(dataMeals['strMeal']);
      if (result.length == 20) {
        break;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'List of meal started with b',
            ),
            FutureBuilder(
              initialData: List<String>.empty(),
                builder: (context, AsyncSnapshot<List<String>> snapShotData) {
              if (snapShotData.connectionState == ConnectionState.done &&
                  snapShotData.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapShotData.data?.length,
                  itemBuilder: (context, index) {
                    print(snapShotData.data);
                    String title = snapShotData.data![index];
                    return ListTile(
                      title: Text(title),
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
    // getData();
    super.initState();
  }
}

import 'package:flutter/material.dart';
import 'package:food_topia/injection_container.dart' as di;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_topia/app_module.dart';
import 'package:food_topia/features/presentation/pages/main_page.dart';

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
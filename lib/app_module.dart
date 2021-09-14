import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_topia/features/presentation/pages/detail.dart';
import 'package:food_topia/features/presentation/pages/favourites.dart';
import 'package:food_topia/features/presentation/pages/main_page.dart';
// app_module.dart
class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => FoodListPage(title: "Foods List")),
    ChildRoute('/detail', child: (_, args2) => FoodDetailPage(args2.data)),
    ChildRoute('/favourites', child: (_, __) => FoodFavouritesPage(title: "Favourites")),
  ];

}
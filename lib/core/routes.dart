import 'package:challenge/presentation/favorites_page/favorites_page.dart';
import 'package:flutter/material.dart';

import '../presentation/add_item_category_page/view/add_item_category_page.dart';
import '../presentation/home_page/view/home_page.dart';

class MyRoutes {
  var routes = <String, WidgetBuilder>{
    HomePage.routeName: (context) => const HomePage(),
    AddItemCategoryPage.routeName: (context) => const AddItemCategoryPage(),
    FavoritesPage.routeName: (context) => const FavoritesPage(),
  };
}

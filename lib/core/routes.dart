import 'package:flutter/material.dart';

import '../presentation/home_page/view/home_page.dart';

class MyRoutes {
  var routes = <String, WidgetBuilder>{
    HomePage.routeName: (context) => const HomePage(),
  };
}

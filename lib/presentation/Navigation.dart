import 'package:flutter/cupertino.dart';
import 'package:tape_letape/presentation/screen/MainScreen.dart';

class Navigation {
  static NavRoute home = NavRoute(url: "/");

  static Map<String, WidgetBuilder> routes = {
    home.url: (BuildContext context) => MainScreen(),
  };
}

class NavRoute {
  String url;

  NavRoute({required this.url});
}

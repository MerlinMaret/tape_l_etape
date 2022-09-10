import 'package:flutter/cupertino.dart';
import 'package:tape_letape/presentation/screen/player/CreatePlayerScreen.dart';
import 'package:tape_letape/presentation/screen/score/ScoreScreen.dart';

class Navigation {
  static NavRoute createUsers = NavRoute(url: "/");
  static NavRoute score = NavRoute(url: "/game");

  static Map<String, WidgetBuilder> routes = {
    createUsers: (BuildContext context) => const CreatePlayerScreen(),
    score: (BuildContext context) => const ScoreScreen(),
  }.map((key, value) => MapEntry(key.url, value));

  static void pushRoute(BuildContext context, NavRoute route){
    Navigator.pushNamed(context, route.url);
  }

}

class NavRoute {
  String url;

  NavRoute({required this.url});
}
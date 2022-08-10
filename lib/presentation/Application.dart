import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tape_letape/presentation/Navigation.dart';
import 'package:tape_letape/presentation/screen/MainScreen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.deviceLocale,
      routes: Navigation.routes
    );
  }
}

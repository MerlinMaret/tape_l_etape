import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tape_letape/AppConfig.dart';
import 'package:tape_letape/presentation/Application.dart';

Future<void> main() async {

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: AppConfig.supportedLocales,
      path: AppConfig.translationsPath,
      // MultiRepositoryProvider is used to inject all necessaries RepositoryProvider needed in the app
      child: Application()
    ),
  );
}

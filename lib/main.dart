import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tape_letape/AppConfig.dart';
import 'package:tape_letape/domain/provider/InteractorProvider.dart';
import 'package:tape_letape/presentation/Application.dart';
import 'package:tape_letape/presentation/provider/AppBlocProvider.dart';
import 'domain/provider/RepositoryProvider.dart';

Future<void> main() async {
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: AppConfig.supportedLocales,
        path: AppConfig.translationsPath,
        // MultiRepositoryProvider is used to inject all necessaries RepositoryProvider needed in the app
        child: AppProviders(
          child: const Application(),
        )),
  );
}

class AppProviders extends StatelessWidget {
  Widget child;

  AppProviders({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: RepositoryProvider.providers,
        child: MultiProvider(
          providers: InteractorProvider.providers,
          child: MultiProvider(
            providers: AppBlocProvider.providers,
            child: child,
          ),
        )
    );
  }
}

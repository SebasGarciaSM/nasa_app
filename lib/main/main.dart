import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/main/app_module.dart';
import 'package:nasa_app/ui/modules/apod/viewmodels/apod_view_model.dart';
import 'package:nasa_app/ui/modules/asteroids/viewmodels/asteroids_view_model.dart';
import 'package:nasa_app/ui/modules/epic/viewmodels/epic_view_model.dart';
import 'package:nasa_app/ui/modules/mars/viewmodels/mars_view_model.dart';
import 'package:nasa_app/ui/theme/dark_theme.dart';
import 'package:nasa_app/ui/theme/light_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Modular.get<ApodViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => Modular.get<AsteroidsViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => Modular.get<EpicViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => Modular.get<MarsViewModel>(),
        ),
      ],
      child: ModularApp(
        module: AppModule(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Nasa App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: Modular.routerConfig,
    );
  }
}

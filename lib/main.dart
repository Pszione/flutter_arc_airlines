import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/network_experiments/data/data.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.init();

  di<JsonPlaceholderDatasource>().testApiCalls();
  di<RequestResDatasource>().testApiCalls();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: move to theme
    final primaryLightColor = Color(0xffc61eab);
    final primaryDarkColor = Color(0xff8c238b);
    final themeLight = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryLightColor,
        primary: primaryLightColor,
        dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
      ),
    );
    final themeDark = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryDarkColor,
        primary: primaryDarkColor,
        dynamicSchemeVariant: DynamicSchemeVariant.vibrant,
      ),
    );

    return MaterialApp(
      title: 'Arc Airlines',
      theme: themeLight,
      darkTheme: themeDark,
      home: const MyHomePage(),
    );
  }
}

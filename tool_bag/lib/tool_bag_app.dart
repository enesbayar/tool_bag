import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'services/custom_dynamic_theme.dart';

class ToolBagApp extends StatelessWidget {
  final Brightness selectedBrightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return CustomDynamicTheme(
        defaultBrightness: selectedBrightness,
        data: (brightness) => buildThemeData(brightness),
        themedWidgetBuilder: (context, theme) {
          return buildMaterialApp(theme);
        });
  }

  ThemeData buildThemeData(Brightness brightness) {
    return new ThemeData(
      primarySwatch: Colors.teal,
      brightness: brightness,
    );
  }

  MaterialApp buildMaterialApp(ThemeData theme) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToolBag',
      theme: theme,
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
 // Color get buttonColor => Theme.of(this).buttonColor;
 TextTheme get textTheme => Theme.of(this).textTheme;

 TextStyle get titleLarge => const TextStyle(
       fontSize: 20,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Colors.grey,
     );
 
}
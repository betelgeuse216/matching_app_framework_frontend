import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    // アプリの全体の明るさ（light or dark）
    brightness: Brightness.light,

    // アプリの基本色
    primaryColor: Colors.white,

    // アクセントカラー
    accentColor: Colors.pinkAccent[200],

    // ScaffoldWidgetの背景色
    scaffoldBackgroundColor: Colors.white,
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:matching_app_framework/const/theme.dart';
import 'package:matching_app_framework/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja', ''), //日本語
        const Locale('en', ''), //英語
      ],
      title: 'Flutter Demo',
      theme: getThemeData(),
      home: Home(title: 'Matching App Framework'),
      locale: Locale('en'),
    );
  }
}
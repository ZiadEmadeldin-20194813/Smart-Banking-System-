import 'dart:io';

import '../locator.dart';
import '../FacePages/home.dart';
import '../pages/f1.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../languages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


import '../theme/theme_constants.dart';
import '../theme/theme_manager.dart';
import '../theme_service.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  setupServices();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: f1(),
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'SU'),
      ],
      translations: Langauges(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
//lasttttttttttttttttt Inshallahh
import 'package:flutter/material.dart';
import 'package:yollo/screens/screens.dart';
import 'package:yollo/config/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yollo',
      theme: ThemeData.light().copyWith(
        primaryColor: Palette.kYolloPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id : (context) => SplashScreen(),
        NavScreen.id : (context) => NavScreen(),
      },
    );
  }
}


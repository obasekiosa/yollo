import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yollo/config/config.dart';
import 'package:yollo/widgets/widgets.dart';
import 'package:yollo/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash_screen';



  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, NavScreen.id);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: MyCustomClipper(radius: 70.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.kPurple,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/yollo_logo.svg",
                    semanticsLabel: 'Yollo Logo',
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'YOLLO',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Palette.kPurple,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}

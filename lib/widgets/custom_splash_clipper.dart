import 'package:flutter/material.dart';


class MyCustomClipper extends CustomClipper<Path> {
  final double radius;
  const MyCustomClipper({@required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height - radius, radius, size.height- radius);
    path.lineTo(size.width - radius, size.height - radius);
    path.quadraticBezierTo(size.width, size.height-radius, size.width, size.height - 2 * radius);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
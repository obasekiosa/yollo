import 'package:flutter/material.dart';


class CustomProfileClipper extends CustomClipper<Path> {
  final double radius;
  const CustomProfileClipper({@required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(radius, radius);
    path.quadraticBezierTo(0, radius, 0, 2 * radius);
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width, radius, size.width - radius, radius);
    path.lineTo(radius, radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
import 'package:flutter/material.dart';

class ClipperRegister extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(12, size.height - 120, 40, size.height - 110);
    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width - 5, size.height - 20, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

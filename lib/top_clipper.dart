import 'package:flutter/material.dart';

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * -0.0033333, size.height * 0.9936286);
    path_0.quadraticBezierTo(size.width * 0.1212000, size.height * 0.7015714,
        size.width * 0.2474111, size.height * 0.6962000);
    path_0.cubicTo(
        size.width * 0.4197778,
        size.height * 0.6948143,
        size.width * 0.5342667,
        size.height * 0.9908571,
        size.width * 0.7165778,
        size.height * 0.9966000);
    path_0.quadraticBezierTo(size.width * 0.8648333, size.height * 0.9875286,
        size.width * 0.9994778, size.height * 0.7546286);
    path_0.lineTo(size.width * 1.0033333, size.height * -0.0071429);
    path_0.lineTo(0, 0);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

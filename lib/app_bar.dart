import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/app_images.dart';
import 'package:pokemon/top_clipper.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  const AppBarApp({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: TopClipper(),
          child: Container(color: Colors.amber),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 7.8,
            child: Image.asset(
              AppImages.logo,
              height: MediaQuery.of(context).size.height / 12,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

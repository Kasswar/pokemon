import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/app_colors.dart';

Color generatColors(int index) {
  if (index % 6 == 0) {
    return AppColors.gray;
  } else if (index % 6 == 1) {
    return AppColors.pink;
  } else if (index % 6 == 2) {
    return AppColors.pinkAccent;
  } else if (index % 6 == 3) {
    return AppColors.blue;
  } else if (index % 6 == 4) {
    return AppColors.pink;
  } else {
    return AppColors.yellow;
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/app_colors.dart';

abstract class CustomTextStyle {
  static final poppins20W500Black = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: "Poppins",
  );
  static final poppins13W500Black = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: "Poppins",
  );
  static final poppins14W500White = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: "Poppins",
  );
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list/core/utils/app_colors.dart';

customToast({required String meg, Color? backgroundColor}) {
  Fluttertoast.showToast(
    msg: meg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor ?? AppColors.mintGreen,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

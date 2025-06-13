import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';

AwesomeDialog customAwesomeDialogBox(
  BuildContext context, {
  required TextEditingController controller,
  required void Function()? btnOkOnPress,
}) {
  return AwesomeDialog(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MyCustomTextFormField(
        controller: controller,
        fillColor: AppColors.backGround,
        hint: 'Enter your task',
        obscureText: false,
        label: 'Enter your task',
        enabledBorderColor: AppColors.mintGreen,
      ),
    ),
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    btnOkColor: AppColors.mintGreen,
    dialogBackgroundColor: AppColors.backGround,

    // title: 'Dialog Title',
    // desc: 'Dialog description here.............',
    btnCancelOnPress: () {},
    btnOkOnPress: btnOkOnPress,
  );
}

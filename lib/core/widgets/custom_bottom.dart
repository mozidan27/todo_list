import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';

class MyCustomButtom extends StatelessWidget {
  const MyCustomButtom({
    super.key,
    required this.text,
    this.onTap,
    this.colors,
  });
  final String text;
  final void Function()? onTap;
  final Color? colors;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors ?? AppColors.mintGreen,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(text, style: CustomTextStyle.poppins14W500White),
        ),
      ),
    );
  }
}

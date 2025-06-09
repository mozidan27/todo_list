import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';

class MyCustomTextFormField extends StatelessWidget {
  const MyCustomTextFormField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmittedl,
    this.controller,
    this.validator,
    required this.obscureText,
    required this.label,
  });
  final String hint;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmittedl;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      onChanged: onChanged,

      onFieldSubmitted: onFieldSubmittedl,
      // style: CustomTextStyle.poppins13W500Black.copyWith(
      //   color: AppColors.darkGrey,
      // ),
      decoration: InputDecoration(
        labelStyle: CustomTextStyle.poppins13W500Black.copyWith(
          color: AppColors.darkGrey,
        ),
        labelText: label,
        fillColor: AppColors.white,
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.only(left: 14),
        hintText: hint,
        hintStyle: CustomTextStyle.poppins13W500Black.copyWith(
          color: AppColors.darkGrey,
        ),
        hintFadeDuration: Duration(days: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          // borderSide: BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mintGreen),
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.backGround),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}

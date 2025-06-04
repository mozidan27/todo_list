import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';

class LogInOrSignUpText extends StatelessWidget {
  const LogInOrSignUpText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: CustomTextStyle.poppins13W500Black.copyWith(
              color: AppColors.lighGrey,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: text2,
            style: CustomTextStyle.poppins13W500Black.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.mintGreen,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

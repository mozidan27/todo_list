import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/features/auth/presentation/widgets/circle_image_with_back_arrow.dart';
import 'package:todo_list/features/auth/presentation/widgets/custom_forgot_password_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleImageWithBackArrow(),

            Center(
              child: SvgPicture.asset(
                Assets.imagesForgotPasswordBro,
                height: 300,
              ),
            ),
            Center(
              child: Text(
                "Forgot password?",
                style: CustomTextStyle.poppins20W500Black,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(10),
            Center(
              child: Text(
                "Don't worry! It's happens. Please enter the email address associated with your account.",
                style: CustomTextStyle.poppins13W500Black.copyWith(
                  color: Color(0xff878787),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CustomForgotPasswordField(),
          ],
        ),
      ),
    );
  }
}

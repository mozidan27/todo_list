import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/features/auth/presentation/widgets/circle_image_with_back_arrow.dart';
import 'package:todo_list/features/auth/presentation/widgets/custom_sign_up_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleImageWithBackArrow(),
            verticalSpace(20),

            Center(
              child: Text(
                "Welcome Onboard!",
                style: CustomTextStyle.poppins20W500Black,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(20),
            Center(
              child: Text(
                "Let’s help you meet up your task",
                style: CustomTextStyle.poppins13W500Black.copyWith(
                  color: AppColors.mintGreen,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(child: SvgPicture.asset(Assets.imagesSignup, height: 300)),
            CustomSignUpFormField(),
          ],
        ),
      ),
    );
  }
}

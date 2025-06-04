import 'package:flutter/material.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';
import 'package:todo_list/features/auth/presentation/widgets/login_or_signup_text.dart';

class CustomSignInFormField extends StatelessWidget {
  const CustomSignInFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Form(
        child: Column(
          children: [
            verticalSpace(30),
            MyCustomTextFormField(
              hint: "Enter your email",
              label: "Enter your email",
              obscureText: false,
            ),
            verticalSpace(30),
            MyCustomTextFormField(
              hint: "Enter your password",
              label: "Enter your password",
              obscureText: true,
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "ForgotPassword?",
                      style: CustomTextStyle.poppins13W500Black.copyWith(
                        color: AppColors.mintGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 85.0),
              child: MyCustomButtom(text: "Sign In", onTap: () {}),
            ),
            verticalSpace(33),
            LogInOrSignUpText(
              text1: "Dont have an account ?",
              text2: " Sign Up",
              onTap: () => customReplacementNavigate(context, '/signup'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';
import 'package:todo_list/features/auth/presentation/widgets/login_or_signup_text.dart';

class CustomSignUpFormField extends StatelessWidget {
  const CustomSignUpFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Form(
        child: Column(
          children: [
            MyCustomTextFormField(
              hint: "Enter your full name",
              label: "Enter your full name",
              obscureText: false,
            ),
            verticalSpace(26),
            MyCustomTextFormField(
              hint: "Enter your email",
              label: "Enter your email",
              obscureText: false,
            ),
            verticalSpace(26),
            MyCustomTextFormField(
              hint: "Enter your password",
              label: "Enter your password",
              obscureText: true,
            ),
            verticalSpace(26),
            MyCustomTextFormField(
              hint: "Confirm your Password",
              label: "Confirm your Password",
              obscureText: true,
            ),
            verticalSpace(33),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 85.0),
              child: MyCustomButtom(text: "Sign Up", onTap: () {}),
            ),
            verticalSpace(33),

            LogInOrSignUpText(
              text1: "Already have an account ?",
              text2: " Sign in",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';

class CustomForgotPasswordField extends StatelessWidget {
  const CustomForgotPasswordField({super.key});

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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 85.0),
              child: MyCustomButtom(
                text: "Submit",
                onTap: () => customnavigate(context, '/home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

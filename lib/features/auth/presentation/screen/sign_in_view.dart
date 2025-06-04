import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/features/auth/presentation/widgets/custom_sign_in_form_field.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesCircleImage),
            verticalSpace(50),
            Center(
              child: Text(
                "Welcome Back!",
                style: CustomTextStyle.poppins20W500Black,
                textAlign: TextAlign.center,
              ),
            ),
            Center(child: Image.asset(Assets.imagesLoginImagePNG)),
            CustomSignInFormField(),
          ],
        ),
      ),
    );
  }
}

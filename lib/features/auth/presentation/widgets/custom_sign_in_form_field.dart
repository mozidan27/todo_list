import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/funcations/custom_toast.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/funcations/validation_methods.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_state.dart';
import 'package:todo_list/features/auth/presentation/widgets/login_or_signup_text.dart';

class CustomSignInFormField extends StatelessWidget {
  const CustomSignInFormField({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInFauiler) {
            customToast(
              meg: state.errorMessage,
              backgroundColor: AppColors.red,
            );
          } else if (state is SignInSuccess) {
            FirebaseAuth.instance.currentUser!.emailVerified
                ? customReplacementNavigate(context, '/home')
                : customToast(
                  meg: "Please verify your email",
                  backgroundColor: AppColors.red,
                );
          }
        },
        builder: (context, state) {
          return Form(
            key: authCubit.signInFromKey,
            child: Column(
              children: [
                verticalSpace(30),
                MyCustomTextFormField(
                  validator: emailValidation,
                  hint: "Enter your email",
                  label: "Enter your email",
                  obscureText: false,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                verticalSpace(30),
                MyCustomTextFormField(
                  validator: passwordValidation,
                  hint: "Enter your password",
                  label: "Enter your password",
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                  suffixIcon:
                      authCubit.obscurePasswordTextValue == true
                          ? IconButton(
                            onPressed: authCubit.obscurePasswordText,
                            icon: SvgPicture.asset(
                              Assets.imagesEyeon,
                              height: 17,
                              width: 17,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                          : IconButton(
                            onPressed: authCubit.obscurePasswordText,
                            icon: SvgPicture.asset(
                              Assets.imagesEyeoff,
                              height: 17,
                              width: 17,
                              fit: BoxFit.scaleDown,
                            ),
                          ),

                  obscureText: authCubit.obscurePasswordTextValue!,
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => customnavigate(context, '/forgot'),
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

                state is SignInLoading
                    ? CircularProgressIndicator(color: AppColors.mintGreen)
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 85.0),
                      child: MyCustomButtom(
                        text: "Sign In",
                        onTap: () {
                          if (authCubit.signInFromKey.currentState!
                              .validate()) {
                            authCubit.signInWithEmailAndPassword();
                          }
                        },
                      ),
                    ),
                verticalSpace(33),
                LogInOrSignUpText(
                  text1: "Dont have an account ?",
                  text2: " Sign Up",
                  onTap: () => customReplacementNavigate(context, '/signup'),
                ),
                verticalSpace(15),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/funcations/custom_toast.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/funcations/validation_methods.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_state.dart';
import 'package:todo_list/features/auth/presentation/widgets/login_or_signup_text.dart';

class CustomSignUpFormField extends StatelessWidget {
  const CustomSignUpFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpFauiler) {
            customToast(
              meg: state.errorMessage,
              backgroundColor: AppColors.red,
            );
          } else if (state is SignUpSuccess) {
            customToast(meg: "Successfully, Check your email.");
            customReplacementNavigate(context, '/login');
          }
        },
        builder: (context, state) {
          AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

          return Form(
            key: authCubit.signUpFromKey,
            child: Column(
              children: [
                MyCustomTextFormField(
                  validator: nameValidation,
                  hint: "Enter your full name",
                  label: "Enter your full name",
                  obscureText: false,
                  onChanged: (fullName) {
                    authCubit.fullName = fullName;
                  },
                ),
                verticalSpace(26),
                MyCustomTextFormField(
                  hint: "Enter your email",
                  label: "Enter your email",
                  obscureText: false,
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                  validator: emailValidation,
                ),
                verticalSpace(26),
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

                verticalSpace(33),

                state is SignUpLoading
                    ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mintGreen,
                      ),
                    )
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 85.0),
                      child: MyCustomButtom(
                        text: "Sign Up",
                        onTap: () {
                          if (authCubit.signUpFromKey.currentState!
                              .validate()) {
                            authCubit.signUpWithEmailAndPassword();
                          }
                        },
                      ),
                    ),
                verticalSpace(33),

                LogInOrSignUpText(
                  text1: "Already have an account ?",
                  text2: " Sign in",
                  onTap: () => customReplacementNavigate(context, '/login'),
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

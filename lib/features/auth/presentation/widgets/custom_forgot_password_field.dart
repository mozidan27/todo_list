import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/funcations/custom_toast.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/funcations/validation_methods.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/core/widgets/my_custom_text_form_field.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_state.dart';

class CustomForgotPasswordField extends StatelessWidget {
  const CustomForgotPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is PasswordResetEmailFauiler) {
            customToast(
              meg: state.errorMessage,
              backgroundColor: AppColors.red,
            );
          } else if (state is PasswordResetEmailSuccess) {
            customToast(meg: "We sent you an email, please check your inbox");
            customReplacementNavigate(context, '/login');
          }
        },
        builder: (context, state) {
          return Form(
            key: authCubit.resetPasswordFromKey,
            child: Column(
              children: [
                verticalSpace(30),
                MyCustomTextFormField(
                  validator: emailValidation,
                  hint: "Enter your email",
                  label: "Enter your email",
                  obscureText: false,
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                ),
                verticalSpace(30),

                state is PasswordResetEmailLoading
                    ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mintGreen,
                      ),
                    )
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 85.0),
                      child: MyCustomButtom(
                        text: "Submit",
                        onTap: () {
                          if (authCubit.resetPasswordFromKey.currentState!
                              .validate()) {
                            authCubit.sendPasswordResetEmail();
                          }
                        },
                      ),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}

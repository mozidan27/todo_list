import 'package:flutter/material.dart';
import 'package:todo_list/features/auth/presentation/screen/sign_in_view.dart';
import 'package:todo_list/features/auth/presentation/screen/sign_up_view.dart';
import 'package:todo_list/features/onboarding/presentation/screen/onboarding_view.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    '/login': (context) => SignInView(),
    '/signup': (context) => SignUpView(),
    '/onboarding': (context) => OnBoardingView(),
  };
}

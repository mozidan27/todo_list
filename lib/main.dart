import 'package:flutter/material.dart';
import 'package:todo_list/core/app_router.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/features/onboarding/presentation/screen/onboarding_view.dart';

void main() {
  runApp(const TODo());
}

class TODo extends StatelessWidget {
  const TODo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backGround),
      home: OnBoardingView(),
      debugShowCheckedModeBanner: false,
      routes: buildAppRoutes(),
    );
  }
}

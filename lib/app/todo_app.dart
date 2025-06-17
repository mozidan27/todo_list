import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/app_router.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:todo_list/features/auth/presentation/screen/auth_gate.dart';

class TODo extends StatelessWidget {
  const TODo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backGround),
      home: BlocProvider(create: (context) => AuthCubit(), child: AuthGate()),
      debugShowCheckedModeBanner: false,
      routes: buildAppRoutes(),
    );
  }
}

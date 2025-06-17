import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:todo_list/features/home/data/database.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final myBox = Hive.box('mybox');
    ToDoDataBase db = ToDoDataBase();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.imagesCircleImage),
          verticalSpace(80),
          Center(
            child: SvgPicture.asset(Assets.imagesOnboardingAmico, height: 300),
          ),
          verticalSpace(43),

          Center(
            child: Text(
              "Conquer your to-do list with TODo.",
              style: CustomTextStyle.poppins20W500Black,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(18),
          Center(
            child: Text(
              "Turn your plans into progress. Start ticking off your goals today!",
              style: CustomTextStyle.poppins13W500Black,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(56),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85.0),
            child: MyCustomButtom(
              text: "Get Started",
              onTap: () {
                context.read<AuthCubit>().setOnboardingVisited(true);
                customnavigate(context, "/signup");
              },
            ),
          ),
        ],
      ),
    );
  }
}

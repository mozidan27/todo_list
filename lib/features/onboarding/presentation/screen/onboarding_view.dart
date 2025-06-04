import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.imagesCircleImage),
          verticalSpace(80),
          Center(child: Image.asset(Assets.imagesOnboardingimagePNG)),
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
                customnavigate(context, "/signup");
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/features/home/presentation/widgets/pick_image_widget.dart';

class ProfileImageAndWelcomeText extends StatelessWidget {
  const ProfileImageAndWelcomeText({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 267,
      child: Stack(
        children: [
          SvgPicture.asset(Assets.imagesCircleImage),
          Center(
            child: SvgPicture.asset(
              fit: BoxFit.fill,
              Assets.imagesRectangle,
              width: double.infinity,
            ),
          ),

          Column(
            children: [
              verticalSpace(64),
              Center(child: PickImageWidget()),
              verticalSpace(19),
              Center(
                child: Text(name, style: CustomTextStyle.poppins20W500Black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

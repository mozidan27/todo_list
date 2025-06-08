import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/features/home/presentation/widgets/pick_image_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
                      child: Text(
                        "Welcome Zidan!",
                        style: CustomTextStyle.poppins20W500Black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(19),
          Center(child: SvgPicture.asset(Assets.imagesTaskBro, height: 246)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Todo Tasks.",
                  style: CustomTextStyle.poppins20W500Black.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                verticalSpace(21),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 32),
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Diary Tasks.",
                            style: CustomTextStyle.poppins13W500Black.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Color(0xff878787),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                      verticalSpace(17),
                      Expanded(
                        child: Scrollbar(
                          thumbVisibility: true,
                          thickness: 5,
                          trackVisibility: true,
                          interactive: true,
                          child: Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      side: BorderSide(
                                        color: Colors.black,
                                        width: 2.5,
                                      ),
                                      checkColor: AppColors.mintGreen,
                                      activeColor: AppColors.mintGreen,
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    Text('first task'),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

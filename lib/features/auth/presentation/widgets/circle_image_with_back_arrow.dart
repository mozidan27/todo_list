import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/core/utils/app_assets.dart';

class CircleImageWithBackArrow extends StatelessWidget {
  const CircleImageWithBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.imagesCircleImage),
        // Positioned(
        //   left: 30,
        //   bottom: 40,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       border: Border.all(width: 2),
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).pop();
        //       },
        //       child: Icon(Icons.arrow_back, color: Colors.black),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

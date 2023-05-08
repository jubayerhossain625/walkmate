import 'dart:ffi';

import 'package:filling_slider/filling_slider.dart';
import 'package:flutter/material.dart';
import 'package:walk_mate/feature/presentation/pages/sub_home/components/verrical_slider.dart';
import 'package:walk_mate/feature/presentation/widgets/common_app_bar.dart';

import '../../../../common/strings/app_colors.dart';


class TopItem extends StatelessWidget {
  TopItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      height: 374.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0),bottomLeft: Radius.circular(25.0)),
          color: AppColors.green
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              right: 0.0,
              top: 0.0,
              child: Image.asset('assets/pattern.png')),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CustomAppBar(btnColor: Theme.of(context).primaryColor,textColor: AppColors.white,),
             // Slider of Cheek-point picker
             const VerticalSlider()
           ],
         )


        ],
      ),
    );
  }
}

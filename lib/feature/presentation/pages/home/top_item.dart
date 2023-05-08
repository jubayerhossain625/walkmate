import 'package:flutter/material.dart';
import 'package:walk_mate/feature/presentation/widgets/common_app_bar.dart';

import '../../../common/strings/app_colors.dart';
import '../../../common/strings/app_string.dart';
import '../../widgets/text_widget.dart';


class TopItem extends StatelessWidget {
    TopItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
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
            children:  [
              CustomAppBar(btnColor: Theme.of(context).primaryColor,textColor: AppColors.white,),
              // Header Text
              const Padding(
                padding:  EdgeInsets.only(top: 28.0,left: 24.0,right: 24.0,bottom: 8.0),
                child: TextLtdWidget(
                  line: 2, size: 36.0,color: AppColors.white,
                  title: AppStrings.headerText,
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 9.0,left: 24.0,right: 24.0,),
                child: TextLtdWidget(
                  line: 3, size: 17.0,color: AppColors.white,weight: FontWeight.w500,
                  title: AppStrings.description,
                ),
              ),

            ],
          )

      ],
      ),
    );
  }
}

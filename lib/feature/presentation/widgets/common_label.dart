import 'package:flutter/material.dart';

import '../../common/strings/app_colors.dart';

class CommonLabel extends StatelessWidget {
  const CommonLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 21.0,bottom: 8.0),
      height: 5.0,
      width: 148.0,
      decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }
}

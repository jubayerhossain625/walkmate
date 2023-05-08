import 'package:flutter/material.dart';

import '../../../../common/strings/app_colors.dart';

class SliderBackgroung extends StatelessWidget {
  const SliderBackgroung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 6,
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index) {
          return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                  color: AppColors.whiteState100,
                  height: 6,width: MediaQuery.of(context).size.width*0.8/10,
          );
        }
      ),
    );
  }
}

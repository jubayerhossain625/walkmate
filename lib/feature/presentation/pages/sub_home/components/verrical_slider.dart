
import 'package:filling_slider/filling_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/feature/common/strings/app_colors.dart';
import 'package:walk_mate/feature/common/strings/app_string.dart';
import 'package:walk_mate/feature/model/targetpoint_datamodel.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';

import '../../../../data/provider/target_provider.dart';class VerticalSlider extends StatefulWidget {
  const VerticalSlider({Key? key}) : super(key: key);

  @override
  State<VerticalSlider> createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  double _value = 00.0;

  @override
  void initState() {
    // TODO: implement initState

   setState(() {
     _value =0.0;
   });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return
     Container(
       margin: const EdgeInsets.only(top: 24.0),
       height: 182,
       width: MediaQuery.of(context).size.width,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Container(
               decoration: BoxDecoration(
                   color: AppColors.slateGrey,
                   borderRadius: BorderRadius.circular(14),
                   border: Border.all(
                       color: AppColors.slateGrey,
                       width: 2.0
                   )
               ),
               child: FillingSlider(height: 182,width: 65,color:AppColors.green,fillColor: AppColors.slateGrey,radius: 12.0,

                 onChange: (s,d){
                 setState(() {
                   _value = s*10000;
                  var point = _value.toInt().toString();
                  print(point);
                   Provider.of<TargetProvider>(context, listen: false).cheekPoint(CheekPoint(point:point,));
                 });
                 },
               )
           ),
           const SizedBox(width: 48.0,),
           SizedBox(
             height: 182,
             width: 120.0,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               mainAxisSize: MainAxisSize.max,
               children:  [
                 const TextWidget(title: AppStrings.completed,size: 16,weight: FontWeight.w400,color: AppColors.white,),
                 TextWidget(title:_value.toInt().toString(),size: 24,weight: FontWeight.w700,color: AppColors.white),
                 const Spacer(),
                 const TextWidget(title: AppStrings.target,size: 16,weight: FontWeight.w400,color: AppColors.white),
                  TextWidget(title:context.watch<TargetProvider>().targetData.targetPoint.toString(),size: 24,weight: FontWeight.w700,color: AppColors.white),

               ],
             ),
           )
         ],
       ),
     );
  }
}

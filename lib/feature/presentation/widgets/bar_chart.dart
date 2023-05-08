import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/feature/common/strings/app_colors.dart';

import '../../data/provider/target_provider.dart';



class BarChart extends StatelessWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = context.watch<TargetProvider>().history;
    return SizedBox(
      width: 305,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            height: 207,
            width: 255,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gray),
                right: BorderSide(color: AppColors.gray),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0,right: 8.0),
              child: data.isNotEmpty? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:data.length,
                  itemBuilder: (context,index){
                    var  s = double.tryParse(data[index].targetPoint.toString())!/1000;
                    print(s);
                return Container(
                  margin:  EdgeInsets.only(left: 4.0,right:4,top:   s!*5.88),
                  width: 5.0,
                decoration:BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0)
                ) ,
                );
              }):const SizedBox(),
            ),
          ),


          Positioned(
            bottom: 0.0,left: 0.0,
              child: SizedBox(
                width: 255,
                child: Row(
            children: const [
                Text("12am"),
                Spacer(),
                Text("6"),
                Spacer(),
                Text("12pm"),
                Spacer(),
                Text("6"),
                Spacer(),
            ],
          ),
              )),
          Positioned(
              top: 25.0,right: 0.0,
              child: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("1500m"),
                    Spacer(),
                    Text("1000m"),
                    Spacer(),
                    Text("500m"),
                    Spacer(),
                    Text("0m"),
                  ],
                ),
              )),


        ],
      ),
    );
  }
}

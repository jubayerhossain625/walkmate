import 'package:flutter/material.dart';
import 'package:walk_mate/feature/common/strings/app_colors.dart';
import 'package:walk_mate/feature/common/strings/app_string.dart';
import 'package:walk_mate/feature/presentation/pages/sub_home/sub_home.dart';
import 'package:walk_mate/feature/presentation/widgets/button_widget.dart';
import 'package:walk_mate/feature/presentation/widgets/common_app_bar.dart';
import 'package:walk_mate/feature/presentation/widgets/common_label.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';
import '../../../data/service/dataservice.dart';




class FaillTargets extends StatefulWidget {
  const FaillTargets({Key? key}) : super(key: key);

  @override
  State<FaillTargets> createState() => _FaillTargetsState();
}

class _FaillTargetsState extends State<FaillTargets> {

  late DataService service;

  @override
  Widget build(BuildContext context) {
    //  final provider = Provider.of<DataService>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const CustomAppBar(textColor: AppColors.green,btnColor: AppColors.green,),
            Padding(
              padding: const EdgeInsets.only(top: 48.0,left: 24.0,bottom: 48.0),
              child: Image.asset('assets/congrats.png',height: 160,width: 160,),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 24.0,bottom: 48.0),
              child: TextLtdWidget(
                title: AppStrings.afterCong,
                color: AppColors.green,
                size: 36.0,weight: FontWeight.w700,line: 3,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 24.0,bottom: 48.0),
              child: TextLtdWidget(
                title: AppStrings.description,
                color: AppColors.green,
                size: 18.0,weight: FontWeight.w400,line: 4,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ButtonWidget(onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SubHomeScreen()));
                  },
                    height: 56.0,
                    width: 327,radius: 48.0,
                    widget: const TextWidget(title: "Home",size: 16.0,weight: FontWeight.w600,color: AppColors.white,),
                  ),
                  const CommonLabel(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

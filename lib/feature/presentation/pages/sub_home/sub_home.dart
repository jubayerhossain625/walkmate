import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/feature/model/targetpoint_datamodel.dart';
import 'package:walk_mate/feature/presentation/pages/faill_targets/faill_targets.dart';
import 'package:walk_mate/feature/presentation/pages/sub_home/components/top_item.dart';
import '../../../common/strings/app_colors.dart';
import '../../../common/strings/app_string.dart';
import '../../../data/provider/target_provider.dart';
import '../../../data/service/local_notification_service.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_label.dart';
import '../../widgets/text_widget.dart';
import '../congrats&complete/congrats_and_complete_page.dart';
import 'components/list_of_add_cheekpoint..dart';

class SubHomeScreen extends StatefulWidget {
  const SubHomeScreen({Key? key}) : super(key: key);

  @override
  State<SubHomeScreen> createState() => _SubHomeScreenState();
}

class _SubHomeScreenState extends State<SubHomeScreen> {

  @override
  Widget build(BuildContext context) {
   final data = Provider.of<TargetProvider>(context, listen: false).targetData;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopItem(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextWidget(
                      size: 16,weight: FontWeight.w600,
                      title:AppStrings.cheekPoint.toUpperCase(),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                      color:AppColors.slateGrey, height: 3.0,
                      width: MediaQuery.of(context).size.width*0.9,
                    ),
                  ),
                  const AddCheekList(),
                ],
              ),
            ),
            const Spacer(),
            // Set Limit Button
            ButtonLTDWidget(
              onTap: (){

                setState(() {
                 addCheekPoint();
                });

              },
              bgColor: AppColors.green,
              radius: 48,
              width: 327,height: 56,
              widget: const TextWidget(title:AppStrings.addCheek,
                color: AppColors.white,size: 16.0,weight: FontWeight.w600,
              ),
            ),

            // button Divider
            const SizedBox(height: 16.0,),

            // History Button
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(
                      width: 1,
                      color: AppColors.green
                  )
              ),
              child: ButtonLTDWidget(onTap: (){
                var x = Provider.of<TargetProvider>(context, listen: false);
                x.countingCheekPoint();
                print("total ");
                print(x.totalCheekPoint.point);
                x.getAllCheekPoint();
                markAsCom();
              },
                bgColor: AppColors.white,
                radius: 48,
                width: 327,height: 56,
                widget: const TextWidget(title:AppStrings.markAs,
                  color: AppColors.green,size: 16.0,weight: FontWeight.w600,

                ),
              ),
            ),
            const CommonLabel(),
          ],
        ),
      ),
    );
  }

  addCheekPoint(){

    var x = Provider.of<TargetProvider>(context, listen: false);
    x.countingCheekPoint();
    print("total ");
    print(x.totalCheekPoint.point.toInt());

    if(int.tryParse(x.emptyTarget.targetPoint.toString())! >= x.totalCheekPoint.point.toInt()){
      Provider.of<TargetProvider>(context, listen: false).myCheekPoint(CheekPoint(id: x.cheekpointData.id,point: x.cheekpointData.point));
      x.countingCheekPoint();
      if(int.tryParse(x.emptyTarget.targetPoint.toString())! >= x.totalCheekPoint.point.toInt()){
        return;
      }else{

        NotificationService()
            .showNotification(title: 'Completed ${x.emptyTarget.targetPoint.toString()} m', body: 'Get Start new Target');

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const CongratsCompetes()));
      }

    }else{

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FaillTargets()));
    }

 }


 markAsCom(){
   var x = Provider.of<TargetProvider>(context, listen: false);
   x.countingCheekPoint();
   print("total ");
   print(x.totalCheekPoint.point.toInt());

   setState(() {
     if( int.tryParse(x.emptyTarget.targetPoint.toString())! >= x.totalCheekPoint.point.toInt() ){
       print("Is not Completed");
       NotificationService()
           .showNotification(title: 'Completed ${x.emptyTarget.targetPoint.toString()} m', body: 'Get Start new Target');

       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const CongratsCompetes()));

     }else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FaillTargets()));
     }
   });

 }
 @override
  void initState() {
    // TODO: implement initState
  // markAsCom();
    super.initState();
  }

}

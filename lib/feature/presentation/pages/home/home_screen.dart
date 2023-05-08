import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/feature/model/targetModel.dart';
import 'package:walk_mate/feature/presentation/pages/home/top_item.dart';
import 'package:walk_mate/feature/presentation/pages/sub_home/sub_home.dart';
import 'package:walk_mate/feature/presentation/widgets/button_widget.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';
import '../../../common/strings/app_colors.dart';
import '../../../common/strings/app_string.dart';
import '../../../data/provider/target_provider.dart';
import '../../../data/service/dataservice.dart';
import '../../widgets/common_label.dart';
import '../history/history.dart';
import 'components/silder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    final tar = Provider.of<TargetProvider>(context, listen: false).targetData;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children:  [
           TopItem(),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24.0,top: 15.0,bottom: 15.0),
            child: Column(
              children:  [
                TextLtdWidget(title: AppStrings.addYourTarget.toUpperCase(),
                  color: Theme.of(context).colorScheme.secondary,
                  size: 16.0,
                ),

                // target Slider.
                const SliderWidgets(),

                const Spacer(),
                // Set Limit Button
                ButtonLTDWidget(
                  onTap: (){
                    setState(() {
                      if(int.tryParse(tar.targetPoint.toString())! > 0){
                        addToTargets(tar.targetPoint.toString(),tar.id!.toString());
                      }else{
                        return;
                      }

                    });
                  },
                bgColor: AppColors.green,
                  radius: 48,
                  width: 327,height: 56,
                  widget: const TextWidget(title:AppStrings.setLimit,
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
                    Provider.of<TargetProvider>(context, listen: false).historyData();
                    Provider.of<TargetProvider>(context, listen: false).history.forEach((element) {
                      print(element.time);
                      print(element.targetPoint);
                    });

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  const HistoryPage(),));
                  },
                    bgColor: Theme.of(context).primaryColor,
                    radius: 48,
                    width: 327,height: 56,
                    widget: const TextWidget(title:AppStrings.history,
                      color: AppColors.green,size: 16.0,weight: FontWeight.w600,

                    ),
                  ),
                ),
                const CommonLabel(),
              ],
            ),
          ))
        ],
      ),
    );
  }

 void addToTargets(String tar,String id) async{
   var date = DateTime.now().toIso8601String();
   var time = DateTime.now().hour.toString();
      try {
          DataService().createTask(TargetModel(
            id:  id,
            targetPoint: tar,
            date: date,
            time: time,
          ));

        }catch (e, s) {
          rethrow;
        } finally {
        Provider.of<TargetProvider>(context, listen: false).emptyTarget.date=date;
        Provider.of<TargetProvider>(context, listen: false).emptyTarget.time=time;
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => const SubHomeScreen(),));
        }




  }

}

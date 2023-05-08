
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/feature/presentation/widgets/common_app_bar.dart';
import 'package:walk_mate/feature/presentation/widgets/common_label.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';
import '../../../common/strings/app_colors.dart';
import '../../../data/provider/target_provider.dart';
import '../../widgets/bar_chart.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TargetProvider>(context, listen: false).historyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          CustomAppBar(
            pdLeft: 0.0,
            widget: Row(
            children:  [
              IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back,size: 24.0,color: AppColors.green,) ),
              const TextWidget(title: "History",size: 22,weight: FontWeight.w600,color: AppColors.green,),
            ],
          ),),
           SizedBox(
             width: MediaQuery.of(context).size.width,
             child: Padding(
              padding:const EdgeInsets.only(left: 24.0,top: 20.0,bottom: 30.0),
              child: TextWidget(title: 'LAST 24 HOURS',size:16 ,color: Theme.of(context).colorScheme.secondary,weight: FontWeight.w600,),
          ),
           ),
          const Padding(
              padding:EdgeInsets.symmetric(horizontal: 24.0),
            child: BarChart(),
          ),
          const Spacer(flex: 7,),
          const CommonLabel(),
        ],
      ),
    );
  }
}

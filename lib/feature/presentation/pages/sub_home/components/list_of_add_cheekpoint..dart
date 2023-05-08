import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/feature/model/targetpoint_datamodel.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';

import '../../../../data/provider/target_provider.dart';

class AddCheekList extends StatefulWidget {
  const AddCheekList({Key? key}) : super(key: key);

  @override
  State<AddCheekList> createState() => _AddCheekListState();
}

class _AddCheekListState extends State<AddCheekList> {

  @override
  Widget build(BuildContext context) {

    final data = context.watch<TargetProvider>().targetData.cheekPoint;
    return Container(
      color: Theme.of(context).primaryColor,
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
          itemCount:  data!.length,
          itemBuilder: (context,index) {
          List<CheekPoint> point = data;
            return Container(
              height: 54.0,
              padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 2.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/checkpoint.png",width: 20.35,height: 28.0,),
                  TextWidget(title: "Checkpoint ${index+1}",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 16.0,weight: FontWeight.w400,),
                  const Spacer(),
                   TextWidget(title: point[index].point.toString(),
                    color: Theme.of(context).colorScheme.secondary,
                    size: 14.0,weight: FontWeight.w400,),
                ],
              ),
            );
          }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:uuid/uuid.dart';
import 'package:walk_mate/feature/model/targetpoint_datamodel.dart';
import 'package:walk_mate/feature/presentation/pages/home/components/silder_backgroung.dart';
import '../../../../data/provider/target_provider.dart';
import '../../../widgets/text_widget.dart';


class SliderWidgets extends StatefulWidget {
  const SliderWidgets({Key? key}) : super(key: key);

  @override
  State<SliderWidgets> createState() => _SliderWidgetsState();
}

class _SliderWidgetsState extends State<SliderWidgets> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0,right: 20),
            child: SliderBackgroung(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                SliderTheme(
                  data: const SliderThemeData(
                    thumbColor: Colors.green,
                    overlayColor: Colors.transparent,
                  ),
                  child: SfSlider(
                    min: 00.0,
                    max: 10000.0,
                    interval: 4,
                    enableTooltip: true,
                    thumbIcon:Image.asset("assets/slider.png",),
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    value: _value.toInt(),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _value= newValue;
                        final String uuid =  Uuid().v4();
                        print(uuid.toString());
                        context.read<TargetProvider>().myTarget(TargetsDataModel(id: uuid,targetPoint: _value.toInt().toString()));
                      });
                    },

                  ),
                ),

                Row(children:  [
                  TextWidget(title: "0m",color:Theme.of(context).colorScheme.secondary,),
                  const Spacer(flex: 7,),
                  TextWidget(title: "10000m",color:Theme.of(context).colorScheme.secondary,),
                ],),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

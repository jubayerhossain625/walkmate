
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:walk_mate/feature/presentation/pages/home/home_screen.dart';
import 'package:walk_mate/feature/presentation/widgets/button_widget.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';
import '../../../common/strings/app_colors.dart';
import '../../../common/strings/app_string.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_label.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  //--------------------------------------------------------------------




  //---------------------------------------------------------------------


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if(event.data.isNotEmpty){
      Navigator.pushNamed(context, event.data['path']);
      }{
        print(event.data.keys);
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children:   [

          Expanded(
            child: Container(
              color: Theme.of(context).brightness.index.isOdd ? AppColors.slateGrey : Theme.of(context).colorScheme.background ,
              child: Column(
                children: [
                  // custom AppBar
                  const CustomAppBar(),
                  // Header Text
                  Padding(
                    padding: const EdgeInsets.only(top: 85.0,left: 24.0,right: 24.0,bottom: 16.0),
                    child: TextLtdWidget(
                      line: 2, size: 36.0,color: Theme.of(context).colorScheme.secondary,
                      title: AppStrings.headerText,
                    ),
                  ),
                ],
              ),
            ),
          ),


          Expanded(

            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:   BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.background,
                  Theme.of(context).colorScheme.background,
                ],
                 stops: const [0,1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                image:  DecorationImage(
                  image: AssetImage( Theme.of(context).primaryColor== Colors.black ? 'assets/dark_image.png' : 'assets/image.png'
                  ),
                  fit: BoxFit.fill
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0,right: 24.0,),
                    child: ButtonWidget( onTap: (){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));


                      },
                      height: 65.0,width: 327.0,radius: 48.0,
                      widget: const TextWidget(title: AppStrings.btnStart,color: AppColors.white,size: 16.0,),
                    ),
                  ),

                  const CommonLabel(),

                ],
              ),
            ),
          ),

        ]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/values/themedata.dart';
import '../../data/provider/theme_provider.dart';



class CustomAppBar extends StatefulWidget {
   const CustomAppBar({Key? key, this.btnColor, this.textColor, this.widget, this.pdLeft}) : super(key: key);
   final Color? btnColor;
   final Color? textColor;
   final Widget? widget;
   final double? pdLeft;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  var _darkTheme = true;
  var count = 0;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      count =0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);

    return    Padding(
      padding:  EdgeInsets.only(left: widget.pdLeft ?? 24.0,right: 16.0,top: 76.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
           widget.widget ?? Image.asset("assets/logo_1.png",height: 24,color: widget.textColor,) ,
            const Spacer(),
            InkWell(
              child: SvgPicture.asset('assets/theme.svg',
                height: 24, width: 24,color: widget.btnColor,
              ),
              onTap: (){
                count++;
                setState(() {
                  if( count%2 == 0 ){
                    _darkTheme = true;
                  }else{
                    _darkTheme = false;
                  }
                });
                onThemeChanged(_darkTheme, themeNotifier);
              },
            ),
          ],
        ),
      ),
    );
  }

   void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
     (value)
         ? themeNotifier.setTheme(darkTheme)
         : themeNotifier.setTheme(lightTheme);
     var prefs = await SharedPreferences.getInstance();
     prefs.setBool('darkMode', value);
   }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walk_mate/feature/presentation/pages/congrats&complete/congrats_and_complete_page.dart';
import 'package:walk_mate/feature/presentation/pages/splash/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'feature/common/route_generate.dart';
import 'feature/common/strings/route_string.dart';
import 'feature/common/values/themedata.dart';
import 'feature/data/provider/target_provider.dart';
import 'feature/data/provider/theme_provider.dart';
import 'feature/data/service/local_notification_service.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().initNotification();
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeNotifier>(   create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme)),
            ChangeNotifierProvider<TargetProvider>(   create: (_) => TargetProvider()),
          ],
          child: const MyApp(),
        ),
      );
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walk Mate',
      theme: themeNotifier.getTheme(),
      initialRoute: RouteString.initialRoute,
      onGenerateRoute: AppRoutes().ongenerateRoute,
    );
  }
}

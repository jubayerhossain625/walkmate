import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:walk_mate/feature/common/strings/route_string.dart';
import 'package:walk_mate/feature/presentation/pages/congrats&complete/congrats_and_complete_page.dart';
import 'package:walk_mate/feature/presentation/pages/faill_targets/faill_targets.dart';
import 'package:walk_mate/feature/presentation/pages/home/home_screen.dart';
import 'package:walk_mate/feature/presentation/pages/splash/splash_screen.dart';
import 'package:walk_mate/feature/presentation/pages/sub_home/sub_home.dart';

class AppRoutes {
  Route<dynamic> ongenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case RouteString.initialRoute:
        return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.leftToRightWithFade);

      case RouteString.homeRoute:
        return PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.leftToRightWithFade);

      case RouteString.subHomePage:
        return PageTransition(
            child: const SubHomeScreen(),
            type: PageTransitionType.leftToRightWithFade);


      case RouteString.congComplete:
        return PageTransition(
            child: const CongratsCompetes(),
            type: PageTransitionType.leftToRightWithFade);


      case RouteString.failTarget:
        return PageTransition(
            child: const FaillTargets(),
            type: PageTransitionType.leftToRightWithFade);

      default:
        return errorRoutes();
    }
  }

  errorRoutes() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error Route Occurred"),
      ),
    );
  }
}
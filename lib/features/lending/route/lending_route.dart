import 'package:flutter/material.dart';
import 'package:emcus_project_task/features/lending/view/lending_page.dart';

import '../../splash/view/splash_screen.dart';

class LendingRoute{
  static String splashRoute = "/";
  static String lendingRoute = "/lendingRoute";

  static Widget get child => const SplashScreen ();
  static Widget get lendingChild => const LandingPage();

  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(splashRoute);
  }
}
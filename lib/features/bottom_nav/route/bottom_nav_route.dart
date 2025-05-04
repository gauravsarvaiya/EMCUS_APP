import 'package:emcus_project_task/features/bottom_nav/view/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class BottomNavRoute{
  static String route = "bottomNav";

  static Widget get child => const BottomNavScreen();

  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
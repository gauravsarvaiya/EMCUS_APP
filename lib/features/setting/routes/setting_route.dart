import 'package:emcus_project_task/features/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';

class SettingRoute{
  static String settingRoute = "/Diagnostics";

  static Widget get settingChild => const SettingScreen();

  static goToDashBoardPage(BuildContext context) {
    Navigator.of(context).pushNamed(settingRoute);
  }
}
import 'package:emcus_project_task/features/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';


class DashboardRoute{
  static String dashBoardRoute = "/Diagnostics";

  static Widget get dashBoardChild => const DashboardScreen();

  static goToDashBoardPage(BuildContext context) {
    Navigator.of(context).pushNamed(dashBoardRoute);
  }

}
import 'package:flutter/material.dart';
import '../view/maintenance_screen.dart';

class MaintenanceRoute{
  static String maintenanceRoute = "/maintenance";

  static Widget get maintenanceChild => const MaintenanceScreen();

  static goToMaintenancePage(BuildContext context) {
    Navigator.of(context).pushNamed(maintenanceRoute);
  }
}
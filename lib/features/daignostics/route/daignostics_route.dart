import 'package:flutter/material.dart';
import '../view/daignostics_screen.dart';

class DiagnosticsRoute{
  static String diagnosticsRoute = "/Diagnostics";


  static Widget get diagnosticsChild => const DiagnosticsScreen();


  static goToDiagnosticsPage(BuildContext context) {
    Navigator.of(context).pushNamed(diagnosticsRoute);
  }

}
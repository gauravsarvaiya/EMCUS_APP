import 'package:emcus_project_task/utils/utils.dart';
import 'package:flutter/material.dart';

class Toaster {
  static showMessage(context, {required String msg, bool? isError}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(msg, style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp
      )),
      backgroundColor: (isError ?? true) ? Colors.red: Colors.lightGreen,
      // duration: const Duration(seconds: 3),
    ));
  }
}
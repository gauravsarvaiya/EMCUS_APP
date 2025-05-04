import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
import '../../bottom_nav/common_view/custom_appbar.dart';

class DiagnosticsScreen extends StatefulWidget {
  const DiagnosticsScreen({super.key});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppbar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Diagnostics Screen", style: CustomTextStyle.boldFont22Style),
          ],
        ),
      ),
    );
  }
}

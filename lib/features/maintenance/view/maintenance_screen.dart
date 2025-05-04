import 'package:flutter/material.dart';
import 'package:emcus_project_task/utils/utils.dart';
import '../../bottom_nav/common_view/custom_appbar.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
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
            Text("Maintenance Screen", style: CustomTextStyle.boldFont22Style),
          ],
        ),
      ),
    );
  }
}

import 'package:emcus_project_task/features/daignostics/view/daignostics_screen.dart';
import 'package:emcus_project_task/features/dashboard/view/dashboard_screen.dart';
import 'package:emcus_project_task/features/maintenance/view/maintenance_screen.dart';
import 'package:emcus_project_task/features/setting/view/setting_screen.dart';
import 'package:emcus_project_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          DashboardScreen(),
          MaintenanceScreen(),
          DiagnosticsScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 110.sp,
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 16.sp),
        decoration: BoxDecoration(
            color: Color(0xffC21330),
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.sp),
              right: Radius.circular(20.sp),
            )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(tabList.length, (index) {
                final tabData = tabList[index];
                final isSelected = currentIndex == index;
                return GestureDetector(
                 onTap: (){
                   setState(() {
                     currentIndex = index;
                   });
                 },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: 24.sp,
                          width: 24.sp,
                          child: SvgPicture.asset(tabData.icon ?? "",
                            colorFilter: ColorFilter.mode(
                                isSelected ? Colors.white60:
                                Colors.white,
                                BlendMode.srcIn),

                          )),

                      SizedBox(
                        height: 10.sp,
                      ),

                      Flexible(child: Text(tabData.name ?? "",style: TextStyle(
                          color: isSelected ? Colors.white60:
                          Colors.white,
                        fontSize: 12.sp
                      ),))
                    ],),
                );
              }),
            ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }
}

class TabModel{
  String icon;
  String name;

  TabModel({required this.icon, required this.name});
}

List<TabModel> tabList = [
  TabModel(icon: "assets/icons/dashboard.svg", name: "Dashboard"),
  TabModel(icon: "assets/icons/maintance.svg", name: "Maintenance"),
  TabModel(icon: "assets/icons/diagnotics.svg", name: "Diagnostics"),
  TabModel(icon: "assets/icons/setting.svg", name: "Setting"),
];

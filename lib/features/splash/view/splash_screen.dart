import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../bottom_nav/route/bottom_nav_route.dart';
import 'package:emcus_project_task/utils/utils.dart';
import 'package:emcus_project_task/features/auth/route/auth_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      Future.delayed(const Duration(seconds: 1), () async{

        final user = FirebaseAuth.instance.currentUser;

        final userPrefs = UserPrefs();

        final prefsLoginStatus = await userPrefs.isUserLogin;

        final loginStatus = (prefsLoginStatus == true) && (user != null);

        if (loginStatus) {
          Navigator.pushReplacementNamed(context, BottomNavRoute.route);
        } else {
          Navigator.pushReplacementNamed(context, AuthRoute.loginRoute);
        }
      });
    },);



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 130.sp,
                color:  Color(0xffDC0613),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: 130.sp,
                      decoration: BoxDecoration(
                        color:  Color(0xffDC0613),
                        gradient: LinearGradient(colors: [
                          Colors.black.withValues(alpha:0.1),
                          Colors.black.withValues(alpha:0.3),
                          Colors.black.withValues(alpha:0.4),
                          Colors.black.withValues(alpha:0.6),
                        ],
                          // stops: [0.0,0.75],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),

                    ),
                  ],
                )
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0xff1E1745),
                ),
              )
            ],
          ),

          Positioned(
            top: MediaQuery.sizeOf(context).height/3.5,
            child: Container(
              width: 168.sp,
              height: 172.sp,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/splash_device.png")),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.sizeOf(context).height/2.5,
            right: 37.sp,
            child: Container(
              width: 168.sp,
              height: 172.sp,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/splsh_logo.png")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

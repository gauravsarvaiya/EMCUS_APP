import 'package:emcus_project_task/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/view/login_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../../bottom_nav/view/bottom_nav_screen.dart';
import 'package:emcus_project_task/features/auth/provider/auth_provider.dart';
//
// class LendingPage extends StatefulWidget {
//   const LendingPage({super.key});
//
//   @override
//   State<LendingPage> createState() => _LendingPageState();
// }
//
// class _LendingPageState extends State<LendingPage> {
//   bool? isLogin;
//
//   UserPrefs userPrefs = UserPrefs();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _initApp();
//     },);
//
//   }
//
//   Future<void> _initApp() async {
//     final authProvider = Provider.of<AuthhProvider>(context, listen: false);
//     await Future.delayed(const Duration(seconds: 1));
//
//     // final bool userLoggedIn = false;
//     final userLoggedIn =  authProvider.isAuthenticated;
//
//     setState(() {
//       isLogin = userLoggedIn;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (isLogin == null) {
//       return const SplashScreen();
//     } else if (isLogin == true) {
//       return const BottomNavScreen();
//     } else {
//       return const LoginScreen();
//     }
//   }
// }

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    final userPrefs = UserPrefs();

    final prefsLoginStatus = await userPrefs.isUserLogin;

    final loginStatus = (prefsLoginStatus == true) && (user != null);

    setState(() {
      isLoggedIn = loginStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      return const SplashScreen(); // Optional loading state
    } else if (isLoggedIn!) {
      return const BottomNavScreen();
    } else {
      return const LoginScreen();
    }
  }
}


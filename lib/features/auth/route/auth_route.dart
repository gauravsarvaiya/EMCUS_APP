import 'package:flutter/material.dart';
import '../view/login_screen.dart';
import '../view/sign_up.dart';

class AuthRoute{
  static String loginRoute = "/Login";
  static String registerRoute = "/register";

  static Widget get loginChild => const LoginScreen();
  static Widget get registerChild => const SignUpScreen();

  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(loginRoute);
  }

  static goToRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed(registerRoute);
  }
}
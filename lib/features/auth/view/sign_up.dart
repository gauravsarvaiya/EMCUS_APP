import 'package:emcus_project_task/features/lending/route/lending_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:emcus_project_task/utils/utils.dart';
import '../../../base/base_components/toaster_msg.dart';
import '../../../base/base_components/custom_button.dart';
import '../../../base/base_components/custom_checkbox.dart';
import '../../../base/base_components/custom_rounded_textfield.dart';
import 'package:emcus_project_task/features/auth/provider/auth_provider.dart';

import '../../bottom_nav/route/bottom_nav_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController companyNameController;
  late TextEditingController emailNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    companyNameController = TextEditingController();
    emailNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthhProvider>();
    final signUploader = authProvider.signUpLoader;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: kWhiteColor),
        title: Container(
            height: 31.sp,
            child: Image.asset("assets/images/app_logo.png")
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 25.sp,horizontal: 21.sp),
                margin: EdgeInsets.all(18.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17.sp),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 10.sp,
                      children: [
                        Text("Register",
                          style: TextStyle(
                              color: Color(0xff343131),
                              fontWeight: FontWeight.w700,
                              fontSize: kFont_24
                          ),
                        ),

                        CustomRoundedTextField(
                          headerText: "Name",
                          maxLength: 50,
                          controller: nameController,
                          hint: "Enter your name",
                          isOptional: false,
                          isEnable: true,
                          inputType: TextInputType.text,
                          name: "name",
                          textInputAction: TextInputAction.next,
                        ),

                        CustomRoundedTextField(
                          headerText: "Company Name",
                          maxLength: 50,
                          controller: companyNameController,
                          hint: "Enter your companyName",
                          isOptional: false,
                          isEnable: true,
                          inputType: TextInputType.text,
                          name: "company Name",
                          textInputAction: TextInputAction.next,
                        ),

                        CustomRoundedTextField(
                          headerText: "Email Address",
                          maxLength: 50,
                          controller: emailNameController,
                          hint: "Enter your email address",
                          isOptional: false,
                          isEnable: true,
                          inputType: TextInputType.text,
                          regex: StringValidation.emailValidation,
                          name: "email address",
                          textInputAction: TextInputAction.next,
                        ),

                        CustomRoundedTextField(
                          headerText: "Password",
                          maxLength: 50,
                          controller: passwordController,
                          hint: "Enter your password",
                          isOptional: false,
                          isEnable: true,
                          isSecure: true,
                          inputType: TextInputType.text,
                          name: "password",
                          regex: StringValidation.passwordValidation,
                          maxLine: 1,
                          textInputAction: TextInputAction.next,
                        ),

                        CustomRoundedTextField(
                          headerText: "Confirm Password",
                          maxLength: 50,
                          controller: confirmPassController,
                          hint: "Enter your confirm password",
                          isOptional: false,
                          isSecure: true,
                          isEnable: true,
                          maxLine: 1,
                          inputType: TextInputType.text,
                          regex: StringValidation.passwordValidation,
                          name: "confirm password",
                          textInputAction: TextInputAction.next,
                        ),

                        Row(
                          children: [
                            CustomCheckBox(
                              value: isCheck,
                              onChanged: (val){
                                isCheck = !isCheck;
                                setState(() {});
                              },
                            ),

                            SizedBox(width: 5.sp),

                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'By signing up you are agreeing with the FFE ',
                                      style: TextStyle(
                                          color: Color(0xff343131),
                                          fontWeight: FontWeight.w400,
                                          fontSize: kFont_14
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms & Conditions ',
                                      style: TextStyle( color: Color(0xffD80B19),
                                          fontWeight: FontWeight.w400,
                                          fontSize: kFont_14),
                                    ),
                                    TextSpan(
                                      text: 'and ',
                                      style: TextStyle( color: Color(0xff343131),
                                          fontWeight: FontWeight.w400,
                                          fontSize: kFont_14),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle( color: Color(0xffD80B19),
                                          fontWeight: FontWeight.w400,
                                          fontSize: kFont_14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: CustomButton(
                                  btnColor: Color(0xffF0F3F5),
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  isLoading: false,
                                  btnText: "Cancel",
                                  textStyle: TextStyle(color: Color(0xff000000)),
                                ),
                              ),
                            ),

                            SizedBox(width: 15.sp),

                            Expanded(
                              child: Container(
                                child: CustomButton(

                                  onTap: ()async{
                                    FocusManager.instance.primaryFocus?.unfocus();

                                    HapticFeedback.heavyImpact();

                                    final isFormValid = _formKey.currentState?.validate();

                                    final navigation = Navigator.of(context);

                                    final authProvider = context.read<AuthhProvider>();

                                    if(isFormValid == false) return;

                                    if(isCheck == false){
                                      Toaster.showMessage(context, msg: "Please accept Terms and Conditions");
                                      return ;
                                    }

                                    if(passwordController.text != confirmPassController.text){
                                      Toaster.showMessage(context, msg: "Please enter correct confirm-password");
                                      return ;
                                    }

                                    try {
                                      await authProvider.signUp(emailNameController.text, passwordController.text);

                                      await UserPrefs().setIsLogin(isLogin: true);

                                      navigation.pushNamedAndRemoveUntil(LendingRoute.lendingRoute,(route) => false);

                                      Toaster.showMessage(context, msg: "Register Successfully !! ",isError: false);
                                    } on FirebaseAuthException catch (e) {
                                      print("e === ${e.code}");
                                      setState(() {
                                        authProvider.signUpLoader = false;
                                      });
                                      Toaster.showMessage(context, msg: e.code);
                                    }

                                  },
                                  isLoading: signUploader,
                                  btnText: "Sign In",
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account?",
                              style: TextStyle(
                                  color: Color(0xff343131),
                                  fontWeight: FontWeight.w400,
                                  fontSize: kFont_16
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(4.sp),
                                child: Text("Sign in here",
                                  style: TextStyle(
                                      color: Color(0xffD80B19),
                                      fontWeight: FontWeight.w400,
                                      fontSize: kFont_16
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

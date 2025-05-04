import '../../lending/route/lending_route.dart';
import '../route/auth_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emcus_project_task/utils/utils.dart';
import '../../../base/base_components/custom_rounded_textfield.dart';
import 'package:emcus_project_task/base/base_components/toaster_msg.dart';
import 'package:emcus_project_task/base/base_components/custom_button.dart';
import 'package:emcus_project_task/base/base_components/custom_checkbox.dart';
import 'package:emcus_project_task/features/auth/provider/auth_provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthhProvider>();
    final loginLoader = authProvider.loginLoader;
    return Scaffold(
      backgroundColor: Color(0xff1E1745),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
            height: 31.sp,
            child: Image.asset("assets/images/app_logo.png")
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25.sp,horizontal: 21.sp),
              margin: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(17.sp),
             ),
             child: Form(
               key: _formKey,
               child: Column(
                 spacing: 15.sp,
                 children: [
                   Text("Sign In",
                     style: TextStyle(
                         color: Color(0xff343131),
                         fontWeight: FontWeight.w700,
                         fontSize: kFont_24
                     ),
                   ),

                   CustomRoundedTextField(
                     headerText: "Email Address",
                     maxLength: 50,
                     controller: emailController,
                     hint: "Enter your email address",
                     isOptional: false,
                     isEnable: true,
                     inputType: TextInputType.text,
                     name: "email address",
                     textInputAction: TextInputAction.next,
                     regex: StringValidation.emailValidation,
                   ),

                   CustomRoundedTextField(
                     headerText: "Password",
                     maxLength: 50,
                     controller: passwordController,
                     hint: "Enter your password",
                     isOptional: false,
                     isEnable: true,
                     isSecure: true,
                     maxLine: 1,
                     regex: StringValidation.passwordValidation,
                     inputType: TextInputType.text,
                     name: "password",
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

                       Text("Remember me", style: TextStyle(
                           color: Color(0xff343131),
                           fontWeight: FontWeight.w400,
                           fontSize: kFont_16
                       ),),
                     ],
                   ),

                   Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Forgot Password",
                       style: TextStyle(
                           color: Color(0xffD80B19),
                           fontWeight: FontWeight.w400,
                           fontSize: kFont_16
                       ),
                     ),
                   ),

                   Container(
                     width: 145.sp,
                     child: CustomButton(
                       onTap: ()async{
                         FocusManager.instance.primaryFocus?.unfocus();

                         HapticFeedback.heavyImpact();

                         final isFormValid = _formKey.currentState?.validate();

                         final navigation = Navigator.of(context);

                         final authProvider = context.read<AuthhProvider>();

                         if(isFormValid == false) return;

                         if(isCheck == false){
                           Toaster.showMessage(context, msg: "Please accept remember me !");
                           return ;
                         }

                         try {
                           await authProvider.signIn(
                               emailController.text,
                               passwordController.text
                           );

                           // navigation.pushReplacementNamed(BottomNavRoute.route);

                           await UserPrefs().setIsLogin(isLogin: true);

                           navigation.pushNamedAndRemoveUntil(LendingRoute.lendingRoute,(route) => false);

                           Toaster.showMessage(context, msg: "Login Successfully !! ",isError: false);

                         } on FirebaseAuthException catch (e) {
                           print("e === ${e.code}");
                           setState(() {
                             authProvider.loginLoader = false;
                           });
                           Toaster.showMessage(context, msg: e.code);
                         }

                       },
                       isLoading: loginLoader,
                       btnText: "Sign In",
                     ),
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Don't have an account?",
                         style: TextStyle(
                             color: Color(0xff343131),
                             fontWeight: FontWeight.w400,
                             fontSize: kFont_16
                         ),
                       ),

                       SizedBox(width: 10.sp),

                       GestureDetector(
                         onTap: (){
                           AuthRoute.goToRegisterPage(context);
                         },
                         child: Text("Sign up here",
                           style: TextStyle(
                               color: Color(0xffD80B19),
                               fontWeight: FontWeight.w400,
                               fontSize: kFont_16
                           ),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
            )
          ],
        ),
      ),
    );
  }
}

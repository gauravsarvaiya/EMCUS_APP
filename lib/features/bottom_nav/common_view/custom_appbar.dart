import 'package:emcus_project_task/features/auth/provider/auth_provider.dart';
import 'package:emcus_project_task/features/auth/route/auth_route.dart';
import 'package:emcus_project_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(40.sp),
        child: Container(
          height: 120.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.sp)),
              gradient :LinearGradient(colors: [
                Color(0xffDC0613),
                Color(0xff940816).withOpacity(0.9),
              ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  children: [
                    SizedBox(
                        height: 24.sp,
                        width: 24.sp,
                        child: SvgPicture.asset("assets/icons/drawer.svg",)),
                    Expanded(
                      child: Container(
                          height: 31.sp,
                          child: Image.asset("assets/images/app_logo.png")
                      ),
                    ),

                    InkWell(
                      onTap: () async {
                        final authProvider =  context.read<AuthhProvider>();
                        final navigation = Navigator.of(context);

                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Are you sure you want to logout?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                        );

                        if (shouldLogout == true) {
                          try {
                            await authProvider.signOut();
                            // Navigator.popUntil(context, (route) => route.isFirst);
                            navigation.pushNamedAndRemoveUntil(AuthRoute.loginRoute, (route) => false);
                            await UserPrefs().setIsLogin(isLogin: false);
                          } catch (e) {
                            print("Sign out error: $e");
                          }
                        }
                      },
                      child: SizedBox(
                        height: 24.sp,
                        width: 24.sp,
                        child: Icon(Icons.logout_outlined, color: kWhiteColor),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10.sp)
            ],
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:emcus_project_task/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../bottom_nav/common_view/custom_appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppbar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
           Color(0xff160961),
           Color(0xff1BA47F),
          ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          ),
          borderRadius: BorderRadius.circular(12.sp),
          border: Border.all(color: kLightGrayColor,width: 1.sp)

        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                  child: SvgPicture.asset("assets/icons/homeBG.svg",fit: BoxFit.fitWidth,),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 28.sp,
              children: [
                Text("SIGNAL STRENGTH",style: CustomTextStyle.textFieldRegularFont16Style.copyWith(color: kWhiteColor)),


                Text("95%",style: CustomTextStyle.boldFont26Style.copyWith(
                    color: kWhiteColor,
                    fontSize: 52.sp
                ),),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.sp,vertical: 15.sp),
                  margin: EdgeInsets.symmetric(horizontal: 40.sp),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("GOOD",style: CustomTextStyle.boldFont26Style.copyWith(
                          color: Color(0xff88B51F),
                        fontSize: 38.sp
                      ),),
                      SizedBox(width: 5.sp),
                      Icon(Icons.check_circle,color: Color(0xff88B51F),size: 38.sp),
                    ],
                  ),
                )


              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'features/auth/provider/auth_provider.dart';
import 'features/lending/route/lending_route.dart';
import 'package:emcus_project_task/utils/utils.dart';

class EmcusApp extends StatelessWidget {
  const EmcusApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthhProvider()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'EMCUS App',
              routes: Routes().routes,
              initialRoute: LendingRoute.splashRoute,
              theme: appTheme(context),
              builder: (context, child) {
                final data  = MediaQuery.of(context);
                return MediaQuery(
                    data: data.copyWith(textScaler: const TextScaler.linear(1.0),),
                    child: child ?? const SizedBox.shrink()
                ) ;
              },
            );
          },
        ),
      ),
    );
  }

  ThemeData appTheme(BuildContext context){
    return ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
            centerTitle: true,
            color: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            foregroundColor: kBlackColor,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: kToolbarHeight,
            titleTextStyle: TextStyle(
                color: kTextSecondaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "humanst521-bt"
            ),
            shape:  UnderlineInputBorder(
              borderSide: BorderSide(color: kTextSecondaryColor.withOpacity(0.30)),
            )
        ),
        primarySwatch: primarySwatchColor,
        useMaterial3: true,
        fontFamily: "humanst521-bt"
    );
  }
}

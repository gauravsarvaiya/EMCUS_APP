library utils;

import 'dart:io';
import 'package:emcus_project_task/features/dashboard/route/dashboard_route.dart';
import 'package:emcus_project_task/features/lending/route/lending_route.dart';
import 'package:emcus_project_task/features/maintenance/routes/maintenance_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/route/auth_route.dart';
import '../features/bottom_nav/route/bottom_nav_route.dart';
import '../features/setting/routes/setting_route.dart';

part 'sizer/size_util.dart';
part 'sizer/size_widget.dart';
part 'sizer/size_extension.dart';
part 'common_utils/extensions.dart';
part 'theme/constants.dart';
part 'theme/constants_style.dart';
part 'routes/routes.dart';
part 'common_utils/user_pref.dart';
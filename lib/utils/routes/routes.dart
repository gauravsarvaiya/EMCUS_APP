part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    LendingRoute.splashRoute:(context) => LendingRoute.child,
    LendingRoute.lendingRoute:(context) => LendingRoute.lendingChild,
    BottomNavRoute.route:(context) => BottomNavRoute.child,
    AuthRoute.loginRoute:(context) => AuthRoute.loginChild,
    AuthRoute.registerRoute:(context) => AuthRoute.registerChild,
    DashboardRoute.dashBoardRoute:(context) => DashboardRoute.dashBoardChild,
    SettingRoute.settingRoute:(context) => SettingRoute.settingChild,
    MaintenanceRoute.maintenanceRoute:(context) => MaintenanceRoute.maintenanceChild,
  };
}
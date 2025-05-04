part of utils;

class UserPrefs{
  //set is login
  Future setIsLogin({required bool isLogin}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('IS_USER_LOGIN', isLogin);
  }

  // Get is login here
  Future<bool> get isUserLogin => _isUserLogin();

  Future<bool> _isUserLogin() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;

    return isLogin;
  }
}
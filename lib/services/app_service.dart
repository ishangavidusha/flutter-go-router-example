import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
// ignore: non_constant_identifier_names
String ONBOARD_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  AppService(this.sharedPreferences);

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;

  set loginState(bool state) {
    sharedPreferences.setBool(LOGIN_KEY, state);
    _loginState = state;
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    sharedPreferences.setBool(ONBOARD_KEY, value);
    _onboarding = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _onboarding = sharedPreferences.getBool(ONBOARD_KEY) ?? false;
    _loginState = sharedPreferences.getBool(LOGIN_KEY) ?? false;

    // This is just to demonstrate the splash screen is working.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.
    await Future.delayed(const Duration(seconds: 2));

    _initialized = true;
    notifyListeners();
  }
}
import 'package:college_bay/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:college_bay/views/login_screen.dart';
import 'package:college_bay/views/reg_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-Register';
  static const String homepage = '/homepage';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      homepage: (context) => HomePageState(),
    };
  }
}

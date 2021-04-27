import 'package:college_bay/views/homepage.dart';
import 'package:college_bay/views/menuScreen.dart';
import 'package:flutter/material.dart';
import 'package:college_bay/views/login_screen.dart';
import 'package:college_bay/views/reg_screen.dart';
import 'package:college_bay/views/menuScreen.dart';
import 'package:college_bay/views/uploadProduct.dart';

class AppRoutes {
  AppRoutes._();
//Directing the mapped pointers to the assigned location.
  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-Register';
  static const String homepage = '/homepage';
  static const String menuScreen = '/menuScreen';
  static const String uploadProduct = '/uploadProduct';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      homepage: (context) => HomePageState(),
      menuScreen: (context) => MenuScreen(),
      uploadProduct: (context) => UploadProduct(),
    };
  }
}

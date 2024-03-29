import 'package:college_bay/theme/routes.dart';
import 'package:flutter/material.dart';
import 'package:college_bay/views/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CollegeBay",
      routes: AppRoutes.define(),
      home: FirstView(),
    );
  }
}
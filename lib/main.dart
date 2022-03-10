import 'package:flutter/material.dart';

import 'package:mobile/Setpassword.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/verify.dart';

import 'package:mobile/styles/colors.dart';
import 'package:mobile/widgets/buttom_nav_bar.dart';

import 'package:sizer/sizer.dart';
import 'Setpassword.dart';
import 'Login.dart';
import 'screens/vendor/end_task_screen.dart';
import 'verify.dart';

import 'screens/vendor/branch_screen.dart';
import 'screens/vendor/google_maps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Route Me',
          theme: ThemeData(
              fontFamily: 'cairo', scaffoldBackgroundColor: AppColors.white),
          home: EndTaskScreen(),

        );

      },
    );
  }
} 


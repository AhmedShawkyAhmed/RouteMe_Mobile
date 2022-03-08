import 'package:flutter/material.dart';
import 'package:mobile/Setpassword.dart';
import 'package:mobile/screens/vendor/home.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/verify.dart';
import 'package:sizer/sizer.dart';
import 'Setpassword.dart';
import 'Login.dart';
import 'verify.dart';

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
          home: verify(),
        );

      },
    );
  }
}


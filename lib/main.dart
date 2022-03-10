import 'package:flutter/material.dart';
import 'package:mobile/screens/vendor/my_tasks.dart';
import 'package:mobile/screens/vendor/order_status_screen.dart';
import 'package:mobile/screens/vendor/request_pick_up_screen.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';

import 'widgets/buttom_nav_bar.dart';

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
          home: MyTasks(),
        );
      },
    );
  }
}


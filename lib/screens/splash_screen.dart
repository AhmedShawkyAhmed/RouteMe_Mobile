import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import '../widgets/buttom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationhome();
  }

  _navigationhome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ButtomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset('assets/Mask_Group_6.png',height: 200,),
              Image.asset('assets/Mask_Group_7.png',height: 200,),
            ],),
            SizedBox(
              width:50.w,
              child: Image.asset('assets/Group_10.png',)
              ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset('assets/Mask_Group_4.png',height: 280),
              Image.asset('assets/Mask_Group_3.png',height: 280),
            ],)
      ],),
    );
  }
}

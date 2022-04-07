import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

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
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.of(context).pushNamed('/login');
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
              Image.asset('assets/images/Mask_Group_6.png',height: 200,),
              Image.asset('assets/images/Mask_Group_7.png',height: 200,),
            ],),
            SizedBox(
              width:50.w,
              child: Image.asset('assets/images/Group_10.png',)
              ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset('assets/images/Mask_Group_4.png',height: 280),
              Image.asset('assets/images/Mask_Group_3.png',height: 280),
            ],)
      ],),
    );
  }
}

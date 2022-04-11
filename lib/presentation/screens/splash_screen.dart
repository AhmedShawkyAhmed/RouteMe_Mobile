import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.of(context).pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            children: [
              Image.asset(
                'assets/images/Mask_Group_6.png',
                height: 200,
              ),
              Image.asset(
                'assets/images/Mask_Group_7.png',
                height: 200,
              ),
            ],
          ),
          SizedBox(
              width: 50.w,
              child: Image.asset(
                'assets/images/Group_10.png',
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            children: [
              Image.asset(
                'assets/images/Mask_Group_4.png',
                height: 280,
              ),
              Image.asset(
                'assets/images/Mask_Group_3.png',
                height: 280,
              ),
            ],
          )
        ],
      ),
    );
  }
}

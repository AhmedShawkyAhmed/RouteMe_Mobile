import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:sizer/sizer.dart';
import 'package:otp_text_field/otp_field.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Mask_Group_1.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/Group_10.png',
                    height: 160,
                  ),
                ),
                Image.asset(
                  'assets/Mask_Group_2.png',
                ),
              ],
            ),
            Container(
              width: 100.w,
              height: 82.h,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 35,
                        top: 35,
                      ),
                      child: Text(
                        'Please Enter the verification Code that was sent via',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 90,
                        bottom: 50,
                      ),
                      child: Text(
                        'example@gmail.com',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(
                        right: 200,
                        bottom: 7,
                      ),
                      child: Text(
                        'Verification Code',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    OTPTextField(
                      otpFieldStyle:
                          OtpFieldStyle(backgroundColor: AppColors.lightGray),
                      outlineBorderRadius: 15,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 43,
                      style: const TextStyle(
                          decoration: TextDecoration.none, fontSize: 25),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 170,),
                      child: DefaultAppButton(
                        text: 'Verify',
                        backGround: AppColors.blue,
                        fontSize: 30,
                        height: 10.h,
                        onTap: () {},
                        width: 48.w,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

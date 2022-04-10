import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
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
      backgroundColor: AppColors.darkPurple,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Image.asset(
                  'assets/images/Mask_Group_1.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Image.asset(
                    'assets/images/Group_10.png',
                    height: 160,
                  ),
                ),
                Image.asset(
                  'assets/images/Mask_Group_2.png',
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: 100.w,
              height: 72.h,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 35,
                      ),
                      child: Text(
                        translate("enterCode"),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 25,
                        left: 25,
                        bottom: 50,
                      ),
                      child: Text(
                        'example@gmail.com',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        bottom: 7,
                      ),
                      child: Text(
                        translate("code"),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: OTPTextField(
                        otpFieldStyle: OtpFieldStyle(
                          backgroundColor: AppColors.lightGray,
                        ),
                        outlineBorderRadius: 10,
                        length: 6,
                        width: 90.w,
                        fieldStyle: FieldStyle.box,
                        fieldWidth: 50,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        },
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 170,
                        ),
                        child: DefaultAppButton(
                          text: translate("verify"),
                          backGround: AppColors.purple,
                          fontSize: 30,
                          height: 10.h,
                          onTap: () {},
                          width: 48.w,
                          textColor: AppColors.white,
                        ),
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

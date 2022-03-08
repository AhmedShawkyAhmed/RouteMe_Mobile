import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/widgets/default_app_button.dart';
import 'package:mobile/widgets/default_password_field.dart';
import 'package:mobile/widgets/default_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
class verify extends StatefulWidget {
  const verify({Key? key}) : super(key: key);

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.darkBlue,

      body: Padding(
        padding: EdgeInsets.only(top:30.h),
        child: Container(
          width: 100.w,
          height: 70.h,

          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(50),
                topRight: Radius.circular(50)

            ),
          ),

          child:Container(
            width: double.infinity,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,),
                Padding(
                  padding: const EdgeInsets.only(bottom : 5.0,left: 45),
                  child: Text('Please Enter the verification Code that was sent via',style: TextStyle(fontSize: 34),),

                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0,right: 170),
                  child: Text('example@gmail.com', style: TextStyle(fontSize: 25),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 300.0,bottom: 10),
                  child: Text('Verification Code' , style: TextStyle(fontSize: 22),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 60,
                    style: TextStyle(
                        fontSize: 25
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: DefaultAppButton(
                    text: 'Verify',
                    backGround: AppColors.blue,
                    fontSize: 30,
                    height: 10.h,
                    onTap: (){},
                    width: 48.w,
                    textColor: AppColors.white ,),
                ),



              ],
            ),
          )  ,
          ),

      ),
    );
  }
}
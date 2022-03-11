import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/widgets/default_app_button.dart';
import 'package:mobile/widgets/default_password_field.dart';
import 'package:mobile/widgets/default_text_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
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

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/Mask_Group_1.png',),
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: Image.asset('assets/Group_10.png',height: 160,),
              ),
              Image.asset('assets/Mask_Group_2.png',),
          ],),
            Container(
              width: 100.w,
              height: 82.h,
      
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
      
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                 
                    Padding(
                      padding: const EdgeInsets.only(left: 35,top: 35,),
                      child: Text('Please Enter the verification Code that was sent via',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90,bottom: 50,),
                      child: Text('example@gmail.com', style: TextStyle(fontSize: 25),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:200,bottom: 7,),
                      child: Text('Verification Code' , style: TextStyle(fontSize: 22),),
                    ),
                    OTPTextField(
                      otpFieldStyle: OtpFieldStyle(backgroundColor:AppColors.lightGray),
                      outlineBorderRadius: 15,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 43,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                          fontSize: 25
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:170),
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
          ],
        ),
      ),
    );
  }
}
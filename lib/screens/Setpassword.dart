import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/widgets/default_app_button.dart';
import 'package:mobile/widgets/default_password_field.dart';
import 'package:mobile/widgets/default_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:otp_text_field/otp_text_field.dart';
class setpassword extends StatefulWidget {
  const setpassword({Key? key}) : super(key: key);

  @override
  State<setpassword> createState() => _setpasswordState();
}

class _setpasswordState extends State<setpassword> {
  TextEditingController password=TextEditingController();
  TextEditingController confpassword=TextEditingController();
  bool pass=true;
  show(){
    setState(() {
      pass=!pass;
    });
  }
  bool pass2=true;
  show1(){
    setState(() {
      pass2=!pass2;
    });
  }
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
          child:Padding(
            padding: const EdgeInsets.only(left : 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start  ,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: Text( 'Set your password', style: TextStyle(fontSize: 30), ),
                ),
                DefaultPasswordField(
                  controller: password,
                  hintText: 'Password',
                  onTap:show,
                  password: pass,

                ),
                DefaultPasswordField(
                    controller: confpassword,
                    hintText: 'Confirm Password',
                    onTap:show1,
                    password: pass2),
                SizedBox(
                  height: 80,),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: DefaultAppButton(
                    text: 'Set',
                    backGround: AppColors.blue,
                    fontSize: 30,
                    height: 10.h,
                    onTap: (){},
                    width: 48.w,
                    textColor: AppColors.white ,),
                )




              ],
            ),
          )  ,
        ),
      ),
    );
  }
}

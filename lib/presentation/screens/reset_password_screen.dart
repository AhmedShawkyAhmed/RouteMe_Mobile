import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:mobile/presentation/widgets/default_password_field.dart';
import 'package:sizer/sizer.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController password=TextEditingController();
  TextEditingController confPassword=TextEditingController();
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
      body: Column(
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
            height: 70.h,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(50),
                  topRight: Radius.circular(50)
              ),
            ),
            child:Padding(
              padding: const EdgeInsets.only(left:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start  ,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(bottom: 60.0),
                    child: Text( 'Set your password', style: TextStyle(fontSize: 30), ),
                  ),
                  DefaultPasswordField(
                    controller: password,
                    hintText: 'Password',
                    onTap:show,
                    password: pass,

                  ),
                  DefaultPasswordField(
                      controller: confPassword,
                      hintText: 'Confirm Password',
                      onTap:show1,
                      password: pass2),
                  const SizedBox(
                    height: 80,),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
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
        ],
      ),
    );
  }
}

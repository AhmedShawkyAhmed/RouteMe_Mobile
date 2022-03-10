import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/widgets/default_app_button.dart';
import 'package:mobile/widgets/default_password_field.dart';
import 'package:mobile/widgets/default_text_field.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController server = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool pass = true;
  show() {
    setState(() {
      pass = !pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Container(
          width: 100.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextField(
                readonly: false,
                controller: server,
                hintText: 'Server name',
              ),
              DefaultTextField(
                readonly: false,
                controller: email,
                hintText: 'Email',
              ),
              DefaultPasswordField(
                  controller: password,
                  hintText: 'Password',
                  onTap: show,
                  password: pass),
              SizedBox(
                height: 30,
              ),
              DefaultAppButton(
                text: 'Login',
                backGround: AppColors.blue,
                fontSize: 30,
                height: 10.h,
                onTap: () {},
                width: 48.w,
                textColor: AppColors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                    onPressed: () {}, child: Text('Forget password...?')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

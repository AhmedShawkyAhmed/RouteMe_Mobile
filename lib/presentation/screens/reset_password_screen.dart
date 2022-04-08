import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool pass = true;
  bool passConf = true;

  show() {
    setState(() {
      pass = !pass;
    });
  }

  showConf() {
    setState(() {
      passConf = !passConf;
    });
  }

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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 35,
                      ),
                      child: Text(
                        translate("resetPassword"),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    DefaultPasswordField(
                      password: pass,
                      validationText: translate("passwordValidate"),
                      controller: password,
                      icon: IconButton(
                        icon: Icon(
                          pass ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: show,
                      ),
                      hintText: translate("password"),
                      submit: (value) {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    DefaultPasswordField(
                      password: passConf,
                      validationText: translate("passwordValidate"),
                      controller: confPassword,
                      icon: IconButton(
                        icon: Icon(
                          passConf ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: showConf,
                      ),
                      hintText: translate("passwordConf"),
                      submit: (value) {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    DefaultAppButton(
                      text: translate("reset"),
                      backGround: AppColors.blue,
                      fontSize: 25,
                      height: 8.h,
                      width: 60.w,
                      textColor: AppColors.white,
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
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

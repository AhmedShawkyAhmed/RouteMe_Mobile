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
    var formKey = GlobalKey<FormState>();
  show() {
    setState(() {
      pass = !pass;
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
                  height: 75.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultTextField(
                          validationText: 'server name must not be empty',
                          readonly: false,
                          controller: server,
                          hintText: 'Server name',
                        ),
                        DefaultTextField(
                          validationText: 'email must not be empty',
                          readonly: false,
                          controller: email,
                          hintText: 'Email',
                        ),
                        DefaultPasswordField(
                          password: pass,
                          validationText: 'password must not be empty',
                            controller: password,
                            icon_widget: IconButton(
                            icon: Icon(pass ? Icons.visibility_off : Icons.visibility),
                            onPressed: show,
                          ),
                            hintText: 'Password',
                            submitte: (value){
                              if (formKey.currentState!.validate()) {
                                      
                                    }
                            },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //state is LoginLoadingState
                       // ? Center(child: CircularProgressIndicator())
                       //: 
                       DefaultAppButton(
                          text: 'Login',
                          backGround: AppColors.blue,
                          fontSize: 30,
                          height: 10.h,
                          onTap: () async {
                            if (formKey.currentState!.validate()){

                            
                                    }
                          },
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
              ],
            ),
          ),
        );
  }
}

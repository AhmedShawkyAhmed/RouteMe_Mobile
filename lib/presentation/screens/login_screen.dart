import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/login_cubit/login_cubit.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:mobile/presentation/widgets/default_password_field.dart';
import 'package:mobile/presentation/widgets/default_text_field.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocProvider(
        create: ((context) => LoginCubit()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state){

        },
        builder: (context, state){
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
                    height: 75.h,
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
                            icon: IconButton(
                              icon: Icon(
                                  pass ? Icons.visibility_off : Icons.visibility),
                              onPressed: show,
                            ),
                            hintText: 'Password',
                            submit: (value) {
                              if (formKey.currentState!.validate()) {}
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DefaultAppButton(
                            text: 'Login',
                            backGround: AppColors.blue,
                            fontSize: 30,
                            height: 10.h,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    server: server.text,
                                    email: email.text,
                                    password: password.text,
                                    endPoint: eLOGIN,
                                );
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
        },
      ),
    );
  }
}

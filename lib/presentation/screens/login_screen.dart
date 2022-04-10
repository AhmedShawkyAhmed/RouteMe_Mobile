import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/login_cubit/login_cubit.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTextField(
                            validationText: translate("serverValidate"),
                            readonly: false,
                            controller: server,
                            hintText: translate("server"),
                          ),
                          DefaultTextField(
                            validationText: translate("emailValidate"),
                            readonly: false,
                            controller: email,
                            hintText: translate("email"),
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
                          const SizedBox(
                            height: 30,
                          ),
                          DefaultAppButton(
                            text: translate("login"),
                            backGround: AppColors.purple,
                            fontSize: 25,
                            height: 8.h,
                            width: 60.w,
                            textColor: AppColors.white,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  server: server.text,
                                  email: email.text,
                                  password: password.text,
                                  endPoint: login,
                                  afterSuccess: () {
                                    print("Done Here");
                                    if (CacheHelper.getDataFromSharedPreference(
                                            key: "type") ==
                                        "Driver") {
                                      print("Done Here 222");
                                      Navigator.of(context).pushNamed('/tasks');
                                    } else if (CacheHelper
                                            .getDataFromSharedPreference(
                                                key: "type") ==
                                        "Vendor") {
                                      print("Done Here 444");
                                      Navigator.of(context).pushNamed('/home');
                                    } else {
                                      print("Can't Login With this User");
                                    }
                                  },
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/verify');
                              },
                              child: Text(
                                translate("forget"),
                              ),
                            ),
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

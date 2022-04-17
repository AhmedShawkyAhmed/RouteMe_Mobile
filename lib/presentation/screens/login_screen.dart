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
import 'package:mobile/presentation/widgets/loading_dialog.dart';
import 'package:mobile/presentation/widgets/toast.dart';
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

  show() {
    setState(() {
      pass = !pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: ((context) => LoginCubit()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.darkPurple,
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultTextField(
                              controller: server,
                              hintText: translate("server"),
                            ),
                            DefaultTextField(
                              controller: email,
                              hintText: translate("email"),
                            ),
                            DefaultPasswordField(
                              password: pass,
                              controller: password,
                              icon: IconButton(
                                icon: Icon(
                                  pass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: show,
                              ),
                              hintText: translate("password"),
                              submit: (value) {},
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
                                server.text == ''?
                                showToast(translate('serverValidate')):
                                email.text == ''?
                                showToast(translate('emailValidate')):
                                password.text == ''?
                                showToast(translate('passwordValidate')):
                                {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return const LoadingDialog();
                                    },
                                  ),
                                  LoginCubit.get(context)
                                      .userLogin(
                                    server: server.text,
                                    email: email.text,
                                    password: password.text,
                                    endPoint: login,
                                    afterSuccess: (){
                                      CacheHelper.getDataFromSharedPreference(
                                          key: "type") ==
                                          "Driver"
                                          ? Navigator.of(context)
                                          .pushNamed('/tasks')
                                          : CacheHelper
                                          .getDataFromSharedPreference(
                                          key: "type") ==
                                          "Vendor"
                                          ? Navigator.of(context)
                                          .pushNamed('/home')
                                          : showToast(translate('passwordValidate'));
                                    },
                                    afterFail: (){
                                      Navigator.pop(context);
                                    },
                                  )
                                };
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
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/view/loading_dialog.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:mobile/presentation/widgets/default_password_field.dart';
import 'package:mobile/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class ResetPassword extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const ResetPassword({this.data, Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();
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
    fToast.init(context);
    return BlocProvider(
      create: ((context) => ResetPasswordCubit()),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
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
                          controller: password,
                          icon: IconButton(
                            icon: Icon(
                              pass ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: show,
                          ),
                          hintText: translate("password"),
                        ),
                        DefaultPasswordField(
                          password: passConf,
                          controller: confPassword,
                          icon: IconButton(
                            icon: Icon(
                              passConf ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: showConf,
                          ),
                          hintText: translate("passwordConf"),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        DefaultAppButton(
                          text: translate("reset"),
                          backGround: AppColors.purple,
                          fontSize: 25,
                          height: 8.h,
                          width: 60.w,
                          textColor: AppColors.white,
                          onTap: () {
                            password.text == '' || confPassword.text == ''
                                ? showToast(translate("passwordValidate"))
                                : confPassword.text != password.text
                                ? showToast(translate("matchPassword"))
                                : {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return const LoadingDialog();
                                },
                              ),
                              ResetPasswordCubit.get(context)
                                  .reset(
                                id: widget.data['userId'].toString(),
                                type: widget.data['type'],
                                password: password.text,
                                afterSuccess: (){
                                  Navigator.pushNamed(
                                    context,
                                    '/login',
                                  );
                                },
                                afterFail: () => Navigator.pop(context)
                              )
                            };
                          },
                        ),
                      ],
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

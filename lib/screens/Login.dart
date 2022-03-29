import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/screens/cubit/login_cubit.dart';
import 'package:mobile/screens/cubit/login_state.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/widgets/default_app_button.dart';
import 'package:mobile/widgets/default_password_field.dart';
import 'package:mobile/widgets/default_text_field.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  TextEditingController server = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool pass = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit =  LoginCubit.get(context);
    return BlocProvider(
      create: ((context) => LoginCubit()),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context , state){
          if (state is LoginSuccessState) {
            // if (state.loginModel) {
              
             

            //   // CacheHelper.saveData(key: 'token', value: state.loginModel.message).then((value) {
            //   //   navigateAndFinish(context, ShopLayout());
            //   // });
            // } else {
            //   // print(state.loginModel.message);
            //   // showToast(
            //   //   text:'${state.loginModel.message}',
            //   //   state: ToastStates.ERROR,
            //   // );
            // }
          }
        },
        builder: (context, state){
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
                          validationText: 'password must not be empty',
                            controller: password,
                            hintText: 'Password',
                            submitte: (value){
                              if (formKey.currentState!.validate()) {
                                      cubit.userLogin(
                                        server: server.text,
                                        email: email.text,
                                        password: password.text,
                                      );
                                    }
                            },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        state is LoginLoadingState
                        ? Center(child: CircularProgressIndicator())
                       : DefaultAppButton(
                          text: 'Login',
                          backGround: AppColors.blue,
                          fontSize: 30,
                          height: 10.h,
                          onTap: () {
                            
                              LoginCubit.get(context).userLogin(
                                server: server.text,
                                email: email.text,
                                password: password.text,
                              );
                              print(server.text);
                              print(email.text);
                              print(password.text);

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
      ) );
  }}

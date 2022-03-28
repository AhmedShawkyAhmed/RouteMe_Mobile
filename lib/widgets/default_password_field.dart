import 'package:flutter/material.dart';
import 'package:mobile/screens/Login.dart';
import 'package:mobile/screens/cubit/login_cubit.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultPasswordField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  VoidCallback? onTap;
  String? validationText;
  bool? password;
  IconData? suffix;
  ValueChanged? submitte;

  DefaultPasswordField({
    required this.controller,
    required this.hintText,
    this.validationText,
    this.submitte,
    this.suffix,
     this.onTap,
     this.password,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
      ),
      child: Container(
        width: 90.w,
        height: 10.h,
        margin: EdgeInsets.symmetric(
          vertical: 0.8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: TextFormField(
          validator: (vlaue) {
            if (vlaue!.isEmpty) {
              return validationText;
            }
            return null;
          },
          controller: controller,
          onFieldSubmitted: submitte,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
          ),
          cursorColor: AppColors.blue,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: IconButton(
                icon: Icon(LoginCubit.get(context).suffix),
                onPressed: (){
                  LoginCubit.get(context).changePasswordVisibility();
                },
              ),
            ),
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontSize: 12.sp,
            ),
            filled: true,
            fillColor: AppColors.lightGray,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
          ),
          obscureText: LoginCubit.get(context).isPassword,
        ),
      ),
    );
  }
}

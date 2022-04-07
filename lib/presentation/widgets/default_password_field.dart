import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultPasswordField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  VoidCallback? onTap;
  String? validationText;
  bool password;
  IconData? suffix;
  ValueChanged? submit;
  Widget? icon;

  DefaultPasswordField({
    required this.controller,
    required this.hintText,
    this.validationText,
    this.submit,
    this.suffix,
     this.onTap,
     this.icon,
    required this.password,
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
          validator: (value) {
            if (value!.isEmpty) {
              return validationText;
            }
            return null;
          },
          controller: controller,
          onFieldSubmitted: submit,
          style: TextStyle(
            color: AppColors.black,
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
               child: icon
               //IconButton(
              //   icon: Icon(password ? Icons.visibility_off : Icons.visibility),
              //   onPressed: onTap,
              // ),
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
          obscureText: password,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  double? width;

  DefaultTextField({
    required this.controller,
    required this.hintText,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0.8.h,
      ),
      child: Container(
        width: 90.w,
        height: 9.5.h,
        margin: EdgeInsets.symmetric(
          vertical: 0.2.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
          ),
          cursorColor: AppColors.blue,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hintText,
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
        ),
      ),
    );
  }
}

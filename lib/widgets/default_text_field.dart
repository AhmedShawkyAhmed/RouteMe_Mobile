import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  double? width;
double? hight;
int? maxline;
  DefaultTextField({
    required this.controller,
    required this.hintText,
    this.width,
    this.hight,
    this.maxline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
      ),
      child: Container(
        width:width?? 90.w,
        height: hight?? 10.h,
        margin: EdgeInsets.symmetric(
          vertical: 0.8.h,
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
          maxLines: maxline?? 1,
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

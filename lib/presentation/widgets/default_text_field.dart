import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLine;
  final bool? readOnly;
  const DefaultTextField({
    required this.controller,
    this.hintText,
    this.readOnly,
    this.width,
    this.height,
    this.maxLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
      ),
      child: Container(
        width: width ?? 90.w,
        height: height ?? 8.h,
        margin: EdgeInsets.symmetric(
          vertical: 0.5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: TextFormField(
          readOnly: readOnly ?? false,
          controller: controller,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
          ),
          cursorColor: AppColors.purple,
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: const TextStyle(
              fontSize: 15,
            ),
            filled: true,
            fillColor: AppColors.lightGray,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
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

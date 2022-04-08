import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? width;
  final double? height;
  final int? maxLine;
  final String? validationText;
  final bool? readonly;
  const DefaultTextField({
    required this.controller,
    required this.hintText,
    required this.readonly,
    this.validationText,
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
          validator: (value) {
            if (value!.isEmpty) {
              return validationText;
            }
            return null;
          },
          readOnly: readonly ?? true,
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          cursorColor: AppColors.blue,
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

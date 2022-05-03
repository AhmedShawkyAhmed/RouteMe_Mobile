import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextLabel extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;

  const DefaultTextLabel({
    required this.title,
    this.width,
    this.height,
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
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.transparent,
          ),
          color: AppColors.lightGray,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

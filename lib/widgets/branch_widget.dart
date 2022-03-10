import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class BranchWidgets extends StatelessWidget {
  String branch;
  String phoneNumber;
  String location;

  BranchWidgets({
    required this.branch,
    required this.phoneNumber,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98.w,
      height: 9.h,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 23,right:23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  branch,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.white,
                  ),
                ),
                Container(
                   width: 12.w,
                  height: 6.5.h,
                  decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                    ),
                  child: IconButton(
                    iconSize: 8.5.w,
                    onPressed: () {},
                    icon: Icon(Icons.phone,color: AppColors.darkBlue,),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

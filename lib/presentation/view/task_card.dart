import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:sizer/sizer.dart';

class TaskCard extends StatelessWidget {
  final String id;
  final String client;
  final String order;
  final String start;
  final String end;
  final VoidCallback onTap;

  const TaskCard({
    required this.id,
    required this.client,
    required this.end,
    required this.order,
    required this.start,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 15,
        bottom: 10,
      ),
      child: Container(
        width: 100.w,
        height: 26.h,
        decoration: BoxDecoration(
          color: AppColors.darkPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  translate('orderNo') + '  ' + id.toString(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Row(
                    children: [
                      Text(
                        translate("Client"),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        client,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Row(
                    children: [
                      Text(
                        translate("count"),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        order,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translate("start"),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        start,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        translate("end"),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        end,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 3),
                  child: DefaultAppButton(
                    onTap: () => onTap(),
                    text: translate("startTask"),
                    height: 5.h,
                    backGround: AppColors.white,
                    fontSize: 15.sp,
                    textColor: AppColors.darkPurple,
                    width: 40.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

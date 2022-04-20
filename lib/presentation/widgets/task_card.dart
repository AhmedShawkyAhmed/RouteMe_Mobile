import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:sizer/sizer.dart';

class TaskCard extends StatelessWidget {
  final int id;
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
        height: CacheHelper.getDataFromSharedPreference(key: "language") == "ar"
            ? 29.h
            : 25.h,
        decoration: BoxDecoration(
          color: AppColors.darkPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 2,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Text(
                id.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("Client"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      client,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("count"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      order,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translate("start"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      start,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      translate("end"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      end,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 3),
                child: DefaultAppButton(
                  onTap: () => onTap(),
                  text: translate("startTask"),
                  height: 7.h,
                  backGround: AppColors.white,
                  fontSize: 18,
                  textColor: AppColors.darkPurple,
                  width: 40.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

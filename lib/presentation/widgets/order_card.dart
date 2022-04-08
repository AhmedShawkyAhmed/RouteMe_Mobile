import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class OrderCard extends StatelessWidget {
  final String order;
  final String client;
  final String phone;
  final String branch;
  final String status;
  final int items;

  const OrderCard({
    required this.order,
    required this.client,
    required this.status,
    required this.phone,
    required this.branch,
    required this.items,
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
        height: 25.h,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 3,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Text(
                order,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("client"),
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
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("phone"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      phone,
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
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("branch"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      branch,
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
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("items"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      items.toString(),
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
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      translate("state"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

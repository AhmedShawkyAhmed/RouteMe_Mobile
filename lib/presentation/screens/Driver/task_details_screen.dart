import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/task_card.dart';

class TaskSetailsScreen extends StatefulWidget {
  @override
  State<TaskSetailsScreen> createState() => _TaskSetailsScreenState();
}

class _TaskSetailsScreenState extends State<TaskSetailsScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 11.5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: Text(
            'Task #7823',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 420,left:30, right: 25),
            child: Container(
                width: 100.w,
                height: 29.h,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, bottom: 0, left: 15, right: 15),
                    child: Column(children: [
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.white,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          children: [
                            Text(
                              'Client : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Khaled Mostafa',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Items : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '7',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Total : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '850 EGP',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '1:30 PM',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'End : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '3:00 PM',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5, right: 6,left:6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultAppButton(
                              onTap: () {},
                              text: 'End Task',
                              height: 7.h,
                              backGround: AppColors.white,
                              fontSize: 17.sp,
                              textColor: AppColors.lightBlue,
                              width: 50.w,
                            ),
                            DefaultIconButton(
                                width: 14.w,
                                buttonColor: AppColors.white,
                                iconColor: AppColors.darkBlue,
                                icon: Icons.phone_rounded,
                                onTap: () {})
                          ],
                        ),
                      ),
                    ]))),
          )
        ],
      ),
    );
  }
}

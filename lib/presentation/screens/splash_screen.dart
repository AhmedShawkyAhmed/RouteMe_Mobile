import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:mobile/business_logic/app_cubit/app_state.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit.get(context).navigate(afterSuccess: () {
          CacheHelper.getDataFromSharedPreference(key: 'isLogin') ?? false
              ? CacheHelper.getDataFromSharedPreference(key: "type") == "Driver"
                  ? Navigator.of(context).pushNamed('/tasks')
                  : Navigator.of(context).pushNamed('/home')
              : Navigator.of(context).pushNamed('/login');
        });
        return Container(
          color: AppColors.darkPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: [
                  Image.asset(
                    'assets/images/Mask_Group_6.png',
                    height: 200,
                  ),
                  Image.asset(
                    'assets/images/Mask_Group_7.png',
                    height: 200,
                  ),
                ],
              ),
              SizedBox(
                  width: 50.w,
                  child: Image.asset(
                    'assets/images/Group_10.png',
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: [
                  Image.asset(
                    'assets/images/Mask_Group_4.png',
                    height: 280,
                  ),
                  Image.asset(
                    'assets/images/Mask_Group_3.png',
                    height: 280,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

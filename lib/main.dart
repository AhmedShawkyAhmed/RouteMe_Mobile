import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/components/constants.dart';
import 'package:mobile/network/local/cache_helper.dart';
import 'package:mobile/network/remote/dio_helper.dart';
import 'package:mobile/screens/cubit/login_cubit.dart';
import 'package:mobile/screens/splash_screen.dart';
import 'package:mobile/screens/vendor/home_layout.dart';
import 'package:mobile/screens/vendor/my_tasks.dart';
import 'package:mobile/screens/vendor/order_status_screen.dart';
import 'package:mobile/screens/vendor/request_pick_up_screen.dart';
import 'package:mobile/shared/bloc_observer.dart';
import 'package:mobile/shared/cubit/cubit.dart';
import 'package:mobile/shared/cubit/states.dart';
import 'package:mobile/styles/colors.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'screens/Driver/end_task_screen.dart';
import 'screens/Driver/task_details_screen.dart';
import 'screens/Login.dart';
import 'screens/Setpassword.dart';
import 'screens/vendor/branch_screen.dart';
import 'screens/vendor/google_maps_screen.dart';
import 'screens/verify.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async{
      await CacheHelper.init();
      DioHelper.init();
      Widget widget;
       

      if (id != null) {
        widget = HomeLayout();
      }else {
        widget = Login();
      }

      runApp( MyApp(startingWidget: widget) );
    },
    blocObserver: MyBlocObserver(),
  );
  
}

class MyApp extends StatelessWidget {
  Widget? startingWidget;
  MyApp({this.startingWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: ((context) => AppCubit()),),
      BlocProvider(
      create: ((context) => LoginCubit()),),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state){},
        builder: (context , state){
          return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Route Me',
              theme: ThemeData(
                  fontFamily: 'cairo', scaffoldBackgroundColor: AppColors.white),
              home:startingWidget,
            );
          },
        );
        },
      ),
    );
  }
}

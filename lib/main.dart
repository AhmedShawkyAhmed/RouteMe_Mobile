import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:mobile/business_logic/app_cubit/app_state.dart';
import 'package:mobile/business_logic/bloc_observer.dart';
import 'package:mobile/business_logic/login_cubit/login_cubit.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/screens/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'presentation/styles/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AppCubit()),),
        BlocProvider(
          create: ((context) => LoginCubit()),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Route Me',
                theme: ThemeData(
                  fontFamily: 'cairo',
                  scaffoldBackgroundColor: AppColors.white,
                ),
                home: const LoginScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

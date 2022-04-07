import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:mobile/business_logic/app_cubit/app_state.dart';
import 'package:mobile/business_logic/bloc_observer.dart';
import 'package:mobile/business_logic/login_cubit/login_cubit.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:sizer/sizer.dart';
import 'data/local/cache_helper.dart';
import 'presentation/router/app_router.dart';
import 'presentation/styles/colors.dart';

late LocalizationDelegate delegate;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      final locale = CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      bool? isLogin = CacheHelper.getDataFromSharedPreference(key: 'login');
      runApp(MyApp(
        appRouter: AppRouter(),
        isLogin: isLogin,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool? isLogin;

  const MyApp({
    required this.appRouter,
    required this.isLogin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AppCubit()),
        ),
        BlocProvider(
          create: ((context) => LoginCubit()),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Route Me',
                localizationsDelegates: [
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  delegate,
                ],
                locale: delegate.currentLocale,
                supportedLocales: delegate.supportedLocales,
                onGenerateRoute: appRouter.onGenerateRoute,
                theme: ThemeData(
                  fontFamily: 'cairo',
                  scaffoldBackgroundColor: AppColors.white,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

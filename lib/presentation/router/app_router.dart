import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/Driver/my_tasks.dart';
import 'package:mobile/presentation/screens/Driver/task_details_screen.dart';
import 'package:mobile/presentation/screens/login_screen.dart';
import 'package:mobile/presentation/screens/reset_password_screen.dart';
import 'package:mobile/presentation/screens/splash_screen.dart';
import 'package:mobile/presentation/screens/vendor/home_layout.dart';
import 'package:mobile/presentation/screens/verify_screen.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(
            builder: (_) => const LoginScreen());
      case '/verify':
        return MaterialPageRoute(
            builder: (_) => const VerifyScreen());
      case '/reset':
        return MaterialPageRoute(
            builder: (_) => const ResetPassword());
      case '/tasks':
        return MaterialPageRoute(
            builder: (_) => MyTasks());
      case '/home':
        return MaterialPageRoute(
            builder: (_) =>  HomeLayout());
      default:
        return null;
    }
  }
}
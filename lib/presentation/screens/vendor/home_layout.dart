import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:mobile/business_logic/app_cubit/app_state.dart';
import 'package:mobile/presentation/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final  formKey = GlobalKey<FormState>();

  HomeLayout({Key? key}) : super(key: key);

  Future<void> permissionLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always) {
        permissionLocation(context);
        return;
      }
    } else if (permission == LocationPermission.deniedForever) {
      const snackBar = SnackBar(
        content: Text("acceptLocationPermission"),
      );
      // ignore: deprecated_member_use
      scaffoldKey.currentState!.showSnackBar(snackBar);
      return;
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: AppCubit.get(context)
              .children[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.purple,
            unselectedItemColor: AppColors.navBar,
            type: BottomNavigationBarType.fixed,
            currentIndex: AppCubit.get(context).currentIndex,
            onTap: (index) {
              AppCubit.get(context).changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.pie_chart,
                ),
                label: translate("orders"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.pin_drop,
                ),
                label: translate("pickup"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.store,
                ),
                label: translate("branches"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                ),
                label: translate("settings"),
              ),
            ],
          ),
        );
      },
    );
  }
}

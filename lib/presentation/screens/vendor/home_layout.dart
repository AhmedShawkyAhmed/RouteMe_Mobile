import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/screens/vendor/order_status_screen.dart';
import 'package:mobile/presentation/screens/vendor/settings_screen.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'branch_screen.dart';
import 'request_pick_up_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  int currentIndex = 0;
  final List<Widget> children = [
    MyOrdersScreen(),
    RequestPickupScreen(),
    const BranchScreen(),
    const Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.purple,
        unselectedItemColor: AppColors.navBar,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.pie_chart,
            ),
            label: translate("status"),
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
  }
}

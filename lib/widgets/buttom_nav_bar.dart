import 'package:flutter/material.dart';
import '../screens/vendor/branch_screen.dart';
import '../screens/vendor/order_status_screen.dart';
import '../styles/colors.dart';
import '../screens/vendor/request_pick_up_screen.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({ Key? key }) : super(key: key);

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int currentIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  final List<Widget> _children = [
    OrderStatusScreen(),
    requestPickUpScreen(),
    BranchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
      currentIndex: currentIndex,     
      items: [
     BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart),
        label: 'State',
        backgroundColor: AppColors.lightBlue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pin_drop),
        label: 'Pick up',
        backgroundColor: AppColors.lightBlue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store),
        label: 'Branches',
        backgroundColor: AppColors.lightBlue,
      ),
      
    ],
    
    ),
    );
  }
}
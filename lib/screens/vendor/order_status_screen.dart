import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_search_field.dart';
import '../../widgets/default_text_field.dart';
import '../../widgets/order_card.dart';

class OrderStatusScreen extends StatelessWidget {
  var _searchContainer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(107),
          child: AppBar(
            backgroundColor: AppColors.darkBlue,
            title: Padding(
              padding: const EdgeInsets.only(top: 112),
              child: Container(
                height: 17.h,
                child: Text(
                  'My Orders',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DefaultSearchField(
                    controller: _searchContainer,
                    hintText: 'Search',
                    onTap: () {},
                    width: 90.w,
                    height: 5.h),
              ),
              preferredSize: Size.fromHeight(5.h),
            ),
          )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10,right: 5,left: 5),
              child: Column(children: [
                OrderCard(order: '#625035', client: 'Magico', status: 'On it\'s way', phone: '01254886243', branch: 'El-Maadi', Items: 4),
                OrderCard(order: '#625035', client: 'Magico', status: 'On it\'s way', phone: '01254886243', branch: 'El-Maadi', Items: 4),
                OrderCard(order: '#625035', client: 'Magico', status: 'On it\'s way', phone: '01254886243', branch: 'El-Maadi', Items: 4),
              
              ],),
            ),
          ),
          
      
    );
  }
}

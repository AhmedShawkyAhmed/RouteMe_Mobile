import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/order_cubit/order_cubit.dart';
import 'package:mobile/data/models/order_model.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_search_field.dart';
import '../../widgets/order_card.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);
  final _searchContainer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            backgroundColor: AppColors.white,
            title: Padding(
              padding: const EdgeInsets.only(
                top: 100,
              ),
              child: SizedBox(
                height: 17.h,
                child: Text(
                  translate("orders"),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColors.darkGray,
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(2.h),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: DefaultSearchField(
                  controller: _searchContainer,
                  hintText: translate("search"),
                  onTap: () {},
                  width: 90.w,
                  height: 6.h,
                ),
              ),
            ),
          )),
      body: BlocBuilder<OrderCubit, List<OrderModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 100.w,
                  height: 60.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: OrderCubit.get(context)
                        .orderResponse!
                        .orders!
                        .length,
                    itemBuilder: (context, position) {
                      return OrderCard(
                          order: OrderCubit.get(context)
                              .orderResponse!
                              .orders![position]
                              .id,
                          status: OrderCubit.get(context)
                              .orderResponse!
                              .orders![position].state,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

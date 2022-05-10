import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/order_cubit/order_cubit.dart';
import 'package:mobile/data/models/order_model.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_search_field.dart';
import '../../view/order_card.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<OrderCubit, List<OrderModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(17.h),
            child: AppBar(
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  translate("orders"),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColors.darkGray,
                  ),
                ),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2.h),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: DefaultSearchField(
                    controller: searchController,
                    hintText: translate("search"),
                    onTap: () {
                      searchController.text == ''
                          ? showToast(translate('searchValidate'))
                          : OrderCubit.get(context).searchOrders(
                              orderId: searchController.text,
                              afterSuccess: () {
                                Navigator.pushNamed(context, "/orderDetails");
                              });
                    },
                    width: 90.w,
                    height: 7.h,
                  ),
                ),
              ),
            ),
          ),
          body: state.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : OrderCubit.get(context).orderResponse!.orders!.isEmpty
                  ? Center(
                      child: Image.asset(
                        "assets/images/noOrder.png",
                        height: 150,
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          OrderCubit.get(context).orderResponse!.orders!.length,
                      itemBuilder: (context, position) {
                        return OrderCard(
                          order: OrderCubit.get(context)
                              .orderResponse!
                              .orders![position]
                              .id,
                          status: translate(OrderCubit.get(context)
                              .orderResponse!
                              .orders![position]
                              .state),
                          onTap: () {
                            OrderCubit.get(context)
                                .searchOrders(
                                  orderId: OrderCubit.get(context)
                                      .orderResponse!
                                      .orders![position]
                                      .id
                                      .toString(),
                                )
                                .then(
                                  (value) => Navigator.pushNamed(
                                      context, "/orderDetails"),
                                );
                          },
                        );
                      },
                    ),
        );
      },
    );
  }
}

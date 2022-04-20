import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/order_cubit/order_cubit.dart';
import 'package:mobile/data/models/order_model.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, List<OrderModel>>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    translate("orderDetails"),
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
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.darkGray,
                ),
              ),
            ),
          ),
          body: state.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                translate("orderNo"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .id
                                    .toString(),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("client"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .clientName,
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("phone"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .clientPhone,
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("items"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .itemCount
                                    .toString(),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("price"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .price
                                    .toString(),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("branch"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .branch,
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("state"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .state,
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                translate("comment"),
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                OrderCubit.get(context)
                                    .searchResponse!
                                    .orders![0]
                                    .comment,
                                style: const TextStyle(
                                  color: AppColors.darkGray,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

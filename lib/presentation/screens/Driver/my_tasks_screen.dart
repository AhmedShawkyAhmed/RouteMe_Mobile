import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/driver_tasks_cubit/driver_tasks_cubit.dart';
import 'package:mobile/data/models/get_driver_tasks_model.dart';
import '../../styles/colors.dart';
import '../../view/task_card.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverTasksCubit, List<MyTasksModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              translate("myTasks"),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.darkGray,
              ),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: AppColors.darkGray,
            ),
            leading: InkWell(
              onTap: () => Navigator.pushNamed(context, "/settings"),
              child: const Icon(
                Icons.settings,
                color: AppColors.darkGray,
              ),
            ),
          ),
          body: state.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: DriverTasksCubit.get(context)
                      .myTasksResponse!
                      .tasks!
                      .length,
                  itemBuilder: (context, position) {
                    return TaskCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/startTask", arguments: {
                          'taskId': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .id,
                          'id': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .orderNumber,
                          'name': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .clientName,
                          'items': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .itemCount,
                          'total': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .price,
                          'start': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .start,
                          'end': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .end,
                          'lat': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .lat,
                          'lon': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .lon,
                          'phone': DriverTasksCubit.get(context)
                              .myTasksResponse!
                              .tasks![position]
                              .clientPhone,
                        });
                      },
                      id: DriverTasksCubit.get(context)
                          .myTasksResponse!
                          .tasks![position]
                          .orderNumber,
                      client: DriverTasksCubit.get(context)
                          .myTasksResponse!
                          .tasks![position]
                          .clientName,
                      order: DriverTasksCubit.get(context)
                          .myTasksResponse!
                          .tasks![position]
                          .orderNumber,
                      start: DriverTasksCubit.get(context)
                          .myTasksResponse!
                          .tasks![position]
                          .start,
                      end: DriverTasksCubit.get(context)
                          .myTasksResponse!
                          .tasks![position]
                          .end,
                    );
                  },
                ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/driver_tasks_cubit/driver_tasks_cubit.dart';
import 'package:mobile/data/models/get_driver_tasks_model.dart';
import '../../styles/colors.dart';
import '../../widgets/task_card.dart';

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverTasksCubit , List<MyTasksModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
        backgroundColor: AppColors.darkPurple,
        leading: const Icon(
          Icons.settings,
          size: 32,
        ),
        centerTitle: true,
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ) ,
       body: state.isEmpty ? const Center(
                  child: CircularProgressIndicator(),
                ):
          ListView.builder(
                       physics: const BouncingScrollPhysics(),
                       itemCount: DriverTasksCubit.get(context)
                           .myTasksResponse!
                           .tasks!
                           .length,
                       itemBuilder: (context, position) {
                         return TaskCard(
                           id: DriverTasksCubit.get(context)
                               .myTasksResponse!
                               .tasks![position]
                               .id,
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

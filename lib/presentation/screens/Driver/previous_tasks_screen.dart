import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/previous_tasks_cubit/previous_tasks_cubit.dart';
import 'package:mobile/data/models/get_driver_tasks_model.dart';
import 'package:mobile/presentation/view/order_card.dart';
import 'package:mobile/presentation/widgets/refresh_widget.dart';
import '../../styles/colors.dart';

class PreviousTasksScreen extends StatelessWidget {
  const PreviousTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreviousTasksCubit, List<MyTasksModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              translate("finished"),
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
              : RefreshWidget(
                onRefresh: PreviousTasksCubit.get(context).getDriverTasks,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: PreviousTasksCubit.get(context)
                        .previousTasksResponse!
                        .tasks!
                        .length,
                    itemBuilder: (context, position) {
                      return OrderCard(
                        onTap: () {},
                        order: PreviousTasksCubit.get(context)
                            .previousTasksResponse!
                            .tasks![position]
                            .id,
                        status: translate(PreviousTasksCubit.get(context)
                            .previousTasksResponse!
                            .tasks![position]
                            .status),
                      );
                    },
                  ),
              ),
        );
      },
    );
  }
}

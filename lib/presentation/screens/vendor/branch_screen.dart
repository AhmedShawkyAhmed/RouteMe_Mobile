import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/branches_cubit/branches_cubit.dart';
import 'package:mobile/data/models/branch_model.dart';
import 'package:mobile/presentation/widgets/add_branch_dialog.dart';
import 'package:sizer/sizer.dart';
import '../../styles/colors.dart';
import '../../widgets/branch_widget.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text(
          translate("branches"),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.darkGray,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BranchesCubit, List<BranchModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return BranchesCubit.get(context)
                  .getBranchesResponse!
                  .branches!
                  .isEmpty
              ? Center(
                  child: Image.asset(
                    "assets/images/noStore.png",
                    height: 150,
                  ),
                )
              : SizedBox(
                  width: 100.w,
                  height: 70.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: BranchesCubit.get(context)
                        .getBranchesResponse!
                        .branches!
                        .length,
                    itemBuilder: (context, position) {
                      return Branches(
                        branch: BranchesCubit.get(context)
                            .getBranchesResponse!
                            .branches![position]
                            .branchName,
                        phone: BranchesCubit.get(context)
                            .getBranchesResponse!
                            .branches![position]
                            .phone,
                        // onTap: () => showDialog(
                        //   context: context,
                        //   builder: (_) {
                        //     return BranchDialog();
                        //   },
                        // ),
                      );
                    },
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: AppColors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BranchDialog();
            },
          );
        },
      ),
    );
  }
}

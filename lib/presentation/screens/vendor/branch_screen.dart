import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/branches_cubit/branches_cubit.dart';
import 'package:mobile/data/models/branch_model.dart';
import 'package:sizer/sizer.dart';
import '../../styles/colors.dart';
import '../../widgets/branch_widget.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text_field.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  TextEditingController branchContainer = TextEditingController();
  TextEditingController phoneContainer = TextEditingController();
  TextEditingController locationContainer = TextEditingController();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              translate("branches"),
              style: const TextStyle(
                fontSize: 30,
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<BranchesCubit, List<BranchModel>>(
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
                BranchesCubit.get(context)
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
                              onTap: (){
                                branchContainer.text = BranchesCubit.get(context)
                                    .getBranchesResponse!
                                    .branches![position]
                                    .branchName!;
                                phoneContainer.text = BranchesCubit.get(context)
                                    .getBranchesResponse!
                                    .branches![position]
                                    .phone!;
                                locationContainer.text = BranchesCubit.get(context)
                                    .getBranchesResponse!
                                    .branches![position]
                                    .address!;
                                scaffoldKey.currentState!
                                    .showBottomSheet(
                                      (context) => showBranchForm(),
                                );
                              },
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          fabIcon,
          size: 45,
        ),
        backgroundColor: AppColors.purple,
        onPressed: () {
          if (isBottomSheetShown) {
            setState(() {
              fabIcon = Icons.add;
            });

            if (formKey.currentState!.validate()) {
              print('no data');
            }
          } else {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => showBranchForm(),
                )
                .closed
                .then((value) {
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.add;
              });
            });
            isBottomSheetShown = true;
            setState(
              () {
                fabIcon = Icons.check;
              },
            );
          }
        },
      ),
    );
  }

  Widget showBranchForm() {
    return Container(
      height: 45.h,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 15,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextField(
                readonly: false,
                controller: branchContainer,
                hintText: translate("hintBranch"),
              ),
              DefaultTextField(
                readonly: false,
                controller: phoneContainer,
                hintText: translate("hintPhone"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultTextField(
                    readonly: false,
                    controller: locationContainer,
                    hintText: translate("address"),
                    width: 63.w,
                  ),
                  DefaultIconButton(
                    width: 14.w,
                    buttonColor: AppColors.darkPurple,
                    iconColor: AppColors.white,
                    icon: Icons.pin_drop,
                    onTap: () => Navigator.pushNamed(context, "/map"),
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

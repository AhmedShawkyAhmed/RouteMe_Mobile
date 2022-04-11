import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/branches_cubit/branches_cubit.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:sizer/sizer.dart';
import '../../styles/colors.dart';
import '../../widgets/branch_widget.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text_field.dart';
import 'google_maps_screen.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var branchContainer = TextEditingController();
  var phoneContainer = TextEditingController();
  var locationContainer = TextEditingController();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;
@override
  void initState() {
    BranchesCubit.get(context).getBranches(
        vendorId: CacheHelper.getDataFromSharedPreference(key: "userId"),
        endPoint: branches,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => BranchesCubit()),
      child: BlocConsumer<BranchesCubit, BranchesState>(
        listener: (context, state) {},
        builder: (context, state) {
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
            body: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  BranchesCubit.get(context).getBranchesResponse!.branches == null?
                      SizedBox()
                  :SizedBox(
                    width: 100.w,
                    height: 70.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: BranchesCubit.get(context).getBranchesResponse!.branches!.length,
                      itemBuilder: (context, position) {
                        return Branches(
                          branch: BranchesCubit.get(context).getBranchesResponse!.branches![0].branchName,
                          phone: BranchesCubit.get(context).getBranchesResponse!.branches![0].phone,
                        );
                      },
                    ),
                  ),
                ],
              ),
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
                          (context) => Container(
                            height: 45.h,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 15,),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DefaultTextField(
                                        readonly: false,
                                        controller: branchContainer,
                                        hintText: 'Branch',
                                        validationText:
                                            'branch must not be empty',),
                                    DefaultTextField(
                                        readonly: false,
                                        controller: phoneContainer,
                                        hintText: 'Phone',
                                        validationText:
                                            'phone must not be empty',),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        DefaultTextField(
                                            readonly: false,
                                            controller: locationContainer,
                                            hintText: 'Location',
                                            validationText:
                                                'location must not be empty',
                                            width: 65.w),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7, bottom: 7),
                                          child: DefaultIconButton(
                                              width: 14.w,
                                              buttonColor: AppColors.darkPurple,
                                              iconColor: AppColors.white,
                                              icon: Icons.location_on,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const GoogleMapsScreen()),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .closed
                        .then((value) {
                      isBottomSheetShown = false;
                      setState(() {
                        fabIcon = Icons.add;
                      });
                    });
                    isBottomSheetShown = true;
                    setState(() {
                      fabIcon = Icons.check;
                    });
                  }
                }),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/pickup_cubit/pickup_cubit.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_text_field.dart';

class RequestPickupScreen extends StatefulWidget {
  const RequestPickupScreen({Key? key}) : super(key: key);

  @override
  State<RequestPickupScreen> createState() => _RequestPickupScreenState();
}

class _RequestPickupScreenState extends State<RequestPickupScreen> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientPhoneController = TextEditingController();
  TextEditingController itemsCountController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  String? branch;

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<PickupCubit, List<dynamic>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            title: Text(
              translate("requestPickup"),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.darkGray,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 40,
              right: 40,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTextField(
                    readonly: false,
                    controller: clientNameController,
                    hintText: translate("hintClient"),
                  ),
                  DefaultTextField(
                    readonly: false,
                    controller: clientPhoneController,
                    hintText: translate("hintPhone"),
                  ),
                  DefaultTextField(
                    readonly: false,
                    controller: itemsCountController,
                    hintText: translate("hintItems"),
                  ),
                  DefaultTextField(
                    readonly: false,
                    controller: totalPriceController,
                    hintText: translate("total"),
                  ),
                  PickupCubit.get(context).branchesName.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            top: 1.h,
                          ),
                          child: Container(
                            width: 80.w,
                            height: 7.7.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 5,
                              ),
                              child: DropdownButton<String>(
                                value: branch,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 36,
                                ),
                                hint: Text(
                                  translate("hintBranch"),
                                ),
                                isExpanded: true,
                                elevation: 1,
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    branch = value!;
                                  });
                                },
                                items: PickupCubit.get(context)
                                    .branchesName
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value!),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: DefaultAppButton(
                      text: translate("request"),
                      backGround: AppColors.darkPurple,
                      fontSize: 20,
                      height: 7.h,
                      onTap: () {
                        clientNameController.text == ''?
                        showToast(translate('clientNameValidate')):
                        clientPhoneController.text == ''?
                        showToast(translate('phoneValidate')):
                        itemsCountController.text == ''?
                        showToast(translate('countValidate')):
                        totalPriceController.text == ''?
                        showToast(translate('priceValidate')):
                        branch == null?
                        showToast(translate('branchValidate')):
                        Navigator.pushNamed(
                          context,
                          "/pickupMap",
                          arguments: {
                            'name': clientNameController.text,
                            'phone': clientPhoneController.text,
                            'count': itemsCountController.text,
                            'price': totalPriceController.text,
                            'branch': branch,
                          },
                        );
                      },
                      width: 60.w,
                      textColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

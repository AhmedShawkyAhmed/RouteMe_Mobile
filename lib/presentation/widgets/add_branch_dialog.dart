import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:mobile/presentation/widgets/default_text_field.dart';
import 'package:sizer/sizer.dart';

class BranchDialog extends StatelessWidget {
  BranchDialog({Key? key}) : super(key: key);

  TextEditingController branchContainer = TextEditingController();
  TextEditingController phoneContainer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 35.h,
          width: 80.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.black,
            ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultTextField(
                  readonly: false,
                  controller: branchContainer,
                  hintText: translate("hintBranch"),
                  width: 70.w,
                ),
                DefaultTextField(
                  readonly: false,
                  controller: phoneContainer,
                  hintText: translate("hintPhone"),
                  width: 70.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultAppButton(
                      text: translate("continue"),
                      backGround: AppColors.darkPurple,
                      fontSize: 20,
                      height: 7.h,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/branchMap",
                          arguments: {
                            'name': branchContainer.text,
                            'phone': phoneContainer.text,
                          },
                        );
                      },
                      width: 35.w,
                      textColor: AppColors.white,
                    ),
                    DefaultAppButton(
                      text: translate("cancel"),
                      backGround: AppColors.gray,
                      fontSize: 20,
                      height: 7.h,
                      onTap: () => Navigator.pop(context),
                      width: 35.w,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/language_cubit/language_cubit.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_icon_button.dart';
import 'package:sizer/sizer.dart';

class LangDialog extends StatelessWidget {
  const LangDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 15.h,
          width:40.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Icon(Icons.close),
                  onTap: () => Navigator.pop(context),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        LanguageCubit.get(context).onLanguageChange();
                        Navigator.pop(context);
                      },
                       child: Text(translate("lang"),
                       style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: AppColors.darkPurple)
                       ),
                       ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

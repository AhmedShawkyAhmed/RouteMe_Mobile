import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/verify_cubit/verify_cubit.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_app_button.dart';
import 'package:mobile/presentation/widgets/default_text_field.dart';
import 'package:mobile/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const VerifyScreen({this.data, Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: ((context) => VerifyCubit()),
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.darkPurple,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset(
                        'assets/images/Mask_Group_1.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: Image.asset(
                          'assets/images/Group_10.png',
                          height: 160,
                        ),
                      ),
                      Image.asset(
                        'assets/images/Mask_Group_2.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    width: 100.w,
                    height: 72.h,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 35,
                            ),
                            child: Text(
                              translate("enterCode"),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 25,
                              left: 25,
                              bottom: 50,
                            ),
                            child: Text(
                              widget.data['email'] ?? '',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Center(
                            child: DefaultTextField(
                              controller: code,
                              hintText: translate("code"),
                              width: 70.w,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 170,
                              ),
                              child: DefaultAppButton(
                                text: translate("verify"),
                                backGround: AppColors.purple,
                                fontSize: 30,
                                height: 10.h,
                                onTap: () {
                                  code.text == widget.data['code']?
                                  Navigator.pushNamed(context, '/reset'):
                                      showToast(translate('codeValidate'));
                                },
                                width: 48.w,
                                textColor: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

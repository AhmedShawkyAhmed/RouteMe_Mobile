import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/business_logic/finish_task_cubit/finish_task_cubit.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/default_text_label.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_text_field.dart';

class EndTaskScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const EndTaskScreen({this.data, Key? key}) : super(key: key);

  @override
  State<EndTaskScreen> createState() => _EndTaskScreenState();
}

class _EndTaskScreenState extends State<EndTaskScreen> {
  TextEditingController commentController = TextEditingController();
  String? taskState;
  List<String> states = [
    'delivered',
    'rejected',
    'cancelled',
    'refund',
    'partial'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinishTaskCubit, FinishTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              translate('endTask'),
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
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.darkGray,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 35,
              right: 35,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTextLabel(
                    title:
                    translate('orderNo') + ' ' + widget.data['id'].toString(),
                  ),
                  DefaultTextLabel(
                    title: translate('totalPrice') +
                        ' ' +
                        widget.data['total'].toString(),
                  ),
                  DefaultTextField(
                    controller: commentController,
                    hintText: translate("addComment"),
                    height: 30.h,
                    maxLine: 8,
                  ),
                  Container(
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
                        value: taskState,
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 36,
                        ),
                        hint: Text(
                          translate("taskState"),
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
                            taskState = value!;
                          });
                        },
                        items: states.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(translate(value)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4.h,
                      bottom: 2.h,
                    ),
                    child: DefaultAppButton(
                      text: translate("finish"),
                      backGround: AppColors.darkPurple,
                      fontSize: 20,
                      height: 8.h,
                      width: 75.w,
                      onTap: () {
                        if (commentController.text == '') {
                          commentController.text = 'noComment';
                          FinishTaskCubit.get(context)
                              .finishTask(
                            taskId: widget.data['taskId'].toString(),
                            orderId: widget.data['id'].toString(),
                            status: taskState.toString(),
                            state: taskState.toString(),
                            comment: commentController.text,
                          )
                              .then((value) =>
                              Navigator.pushNamed(context, "/tasks"));
                        }
                      },
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

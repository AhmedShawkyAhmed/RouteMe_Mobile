import 'package:flutter/material.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text_field.dart';

class EndTaskScreen extends StatefulWidget {
  @override
  State<EndTaskScreen> createState() => _EndTaskScreenState();
}

class _EndTaskScreenState extends State<EndTaskScreen> {
  var orderContainer = TextEditingController();
  var branch = ['Task Status','Done', 'On the way'];
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Task Status';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPurple,
        title: const Text(
          'Task #7823',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 35, right: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultTextField(
                controller: orderContainer,
                hintText: "Order Number",
              ),
              DefaultTextField(
                controller: orderContainer,
                hintText: "Total",
              ),
              DefaultTextField(
                controller: orderContainer,
                hintText: "Comment",
                height: 30.h,
                maxLine: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      DefaultTextField(
                        controller: orderContainer,
                        hintText: "Attach Image",
                        width: 82.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 270),
                        child: DefaultIconButton(
                          width: 10.w,
                          buttonColor: AppColors.darkPurple,
                          iconColor: AppColors.white,
                          icon: Icons.attach_file,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ),

              Container(
                width: 80.w,
                height: 7.7.h,
                margin: const EdgeInsets.only(
                    top: 5,bottom: 10
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    underline: const SizedBox(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 36,
                    ),
                    hint: const Text(""),
                    isExpanded: true,
                    elevation: 1,
                    style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: branch
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              DefaultAppButton(
                text: 'Finish Task',
                backGround: AppColors.darkPurple,
                fontSize: 20,
                height: 8.h,
                width: 75.w,
                onTap: () {},
                textColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

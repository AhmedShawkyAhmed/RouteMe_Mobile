import 'package:flutter/material.dart';
import 'package:mobile/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_app_button.dart';
import '../../widgets/default_text_field.dart';

class requestPickUpScreen extends StatefulWidget {
  @override
  State<requestPickUpScreen> createState() => _requestPickUpScreenState();
}

class _requestPickUpScreenState extends State<requestPickUpScreen> {
  var clientNameContainer = TextEditingController();

  var clientPhoneContainer = TextEditingController();

  var itemsCountContainer = TextEditingController();

  var totalPriceContainer = TextEditingController();

  var addressContainer = TextEditingController();

  var branch = ['branch','maddi', 'nacr city', 'new cairo'];

  String? value;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'branch';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text(
          'Request Pack Up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(children: [
              DefaultTextField(
                readonly: false,
                  controller: clientNameContainer, hintText: 'Clinet Name'),
              DefaultTextField(
                readonly: false,
                  controller: clientPhoneContainer, hintText: 'Client Phone'),
              DefaultTextField(
                readonly: false,
                  controller: itemsCountContainer, hintText: 'Items Count'),
              DefaultTextField(
                readonly: false,
                  controller: totalPriceContainer, hintText: 'Total Price'),
              Container(
                width: 80.w,
                height: 7.7.h,
                margin: EdgeInsets.only(
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
                    underline: SizedBox(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 36,
                    ),
                    hint: Text(""),
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
              DefaultTextField(
                readonly: false,controller: addressContainer, hintText: 'Address'),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: DefaultAppButton(
                    text: 'Recuest',
                    backGround: AppColors.darkBlue,
                    fontSize: 20,
                    height: 7.h,
                    onTap: () {},
                    width: 60.w,
                    textColor: AppColors.white),
              ),
            ]),
        ),
      ),
      
    );
  }
}

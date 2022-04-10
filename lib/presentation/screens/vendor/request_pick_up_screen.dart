import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_text_field.dart';

class RequestPickupScreen extends StatefulWidget {
  @override
  State<RequestPickupScreen> createState() => _RequestPickupScreenState();
}

class _RequestPickupScreenState extends State<RequestPickupScreen> {
  TextEditingController clientNameContainer = TextEditingController();

  TextEditingController clientPhoneContainer = TextEditingController();

  TextEditingController itemsCountContainer = TextEditingController();

  TextEditingController totalPriceContainer = TextEditingController();

  TextEditingController addressContainer = TextEditingController();

  var branch = ['branch', 'maddi', 'nacr city', 'new cairo'];

  String? value;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'branch';
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
        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(children: [
            DefaultTextField(
              readonly: false,
              controller: clientNameContainer,
              hintText: translate("hintClient"),
            ),
            DefaultTextField(
              readonly: false,
              controller: clientPhoneContainer,
              hintText: translate("hintPhone"),
            ),
            DefaultTextField(
              readonly: false,
              controller: itemsCountContainer,
              hintText: translate("hintItems"),
            ),
            DefaultTextField(
              readonly: false,
              controller: totalPriceContainer,
              hintText: translate("total"),
            ),
            Container(
              width: 80.w,
              height: 7.7.h,
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 5,
                ),
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
                  items: branch.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            DefaultTextField(
              readonly: false,
              controller: addressContainer,
              hintText: translate("address"),
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
                onTap: () {},
                width: 60.w,
                textColor: AppColors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

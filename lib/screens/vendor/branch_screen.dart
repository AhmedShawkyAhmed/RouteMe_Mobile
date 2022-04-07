import 'package:flutter/material.dart';
import 'package:mobile/screens/vendor/google_maps_screen.dart';
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
  var branchContainer = TextEditingController();
  var phoneContainer = TextEditingController();
  var locationContainer = TextEditingController();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: AppColors.darkBlue,
          leading: TextButton(
            onPressed: () {},
            child: Text(
              'ع',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Reebok',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 50, right: 50, bottom: 50),
              child: Image(
                image: NetworkImage(
                  'https://pngimg.com/uploads/nike/nike_PNG6.png',
                ),
              ),
            ),
            BranchWidgets(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            fabIcon,
            size: 45,
          ),
          backgroundColor: AppColors.lightBlue,
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
                  .showBottomSheet((context) => Container(
                        height: 45.h,
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 15),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DefaultTextField(
                                    readonly: false,
                                    controller: branchContainer,
                                    hintText: 'Branch',
                                    validationText: 'branch must not be empty'),
                                DefaultTextField(
                                    readonly: false,
                                    controller: phoneContainer,
                                    hintText: 'Phone',
                                    validationText: 'phone must not be empty'),
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
                                          buttonColor: AppColors.darkBlue,
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
                      ))
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
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class BranchModel{
   String? branchName;
   String? phoneNumber;
   String? location;

    BranchModel(
     { 
      required this.branchName, 
      required  this.phoneNumber, 
      required  this.location,
      }
      );
  }

class BranchWidgets extends StatelessWidget {
  // String branch;
  // String phoneNumber;
  // String location;


  // BranchWidgets({
  //   required this.branch,
  //   required this.phoneNumber,
  //   required this.location,
  // });

  
  List<BranchModel> branchs =[
    BranchModel(
      branchName: 'deviceType', 
    phoneNumber: '315404664', 
    location: 'asjkbfbasd'
    ),
    BranchModel(
      branchName: 'devidsfdsf', 
    phoneNumber: '315404664', 
    location: 'asjkbfbasd'
    ),
    BranchModel(
      branchName: 'desdfdse', 
    phoneNumber: '315404664', 
    location: 'asjkbfbasd'
    ),
    BranchModel(
      branchName: 'devisdfsde', 
    phoneNumber: '315404664', 
    location: 'asjkbfbasd'
    ),
    BranchModel(
      branchName: 'devisdfsde', 
    phoneNumber: '315404664', 
    location: 'asjkbfbasd'
    ),
    BranchModel(
      branchName: 'devisdfsde', 
    phoneNumber: '315404664', 
    location: 'asjkbfbasd'
    ),
  ];

  @override
  Widget build(BuildContext context ) {
    return 
      Container(
                  height: 45.h,
                  child: ListView.separated(
                    itemBuilder: (context, index) => buildBranchItem(branchs[index]),
                    separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 15,
                    ),
                    itemCount: branchs.length,
                  ),
                );
    
  }

  Widget buildBranchItem(branch) =>Container(
      width: 98.w,
      height: 9.h,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 23,right:23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${branch.branchName}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.white,
                  ),
                ),
                Container(
                   width: 12.w,
                  height: 6.5.h,
                  decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                    ),
                  child: IconButton(
                    iconSize: 8.5.w,
                    onPressed: () {},
                    icon: Icon(Icons.phone,color: AppColors.darkBlue,),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ); 

}
 

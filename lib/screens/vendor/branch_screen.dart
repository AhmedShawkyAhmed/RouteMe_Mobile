import 'package:flutter/material.dart';
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
  var _branchContainer = TextEditingController();
  bool isSwitched = false;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          actions: [
           Transform.scale(
             scale:1.7,
             child: Padding(
               padding: const EdgeInsets.only(top: 8, right:10),
               child: Switch(
                 
                 activeThumbImage: AssetImage('assets/night-mode (3).png'),
                 inactiveThumbImage: AssetImage('assets/night-mode (2).png'),
                 inactiveThumbColor: Colors.white,
                 activeColor: Colors.white,
                    value: isSwitched,
                    onChanged: (value){
                      setState(() {
                        isSwitched = value;
                      });
                  }),
             ),
           ),
           
          ],
        ),

      ),
      body: Container(
          width:double.infinity,
          child:  Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 50,left:50,right:50,bottom:50),
                   child: Image(image: NetworkImage(
                     'https://p.kindpng.com/picc/s/112-1126481_transparent-adidas-logo-clipart-hockey-brands-hd-png.png',
                     
                     ),),
                 ),
                   BranchWidgets(branch:'Maadi' ,location: 'ff',phoneNumber: 'ff',),
                   SizedBox(height: 10,),
                   BranchWidgets(branch:'Maadi' ,location: 'ff',phoneNumber: 'ff',),
                   SizedBox(height: 10,),
                   BranchWidgets(branch:'Maadi' ,location: 'ff',phoneNumber: 'ff',),
              ],),
        ),
        
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
     BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart),
        label: 'State',
        backgroundColor: AppColors.lightBlue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pin_drop),
        label: 'Pick up',
        backgroundColor: AppColors.lightBlue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store),
        label: 'Branches',
        backgroundColor: AppColors.lightBlue,
      ),
      
    ],
    onTap: (index){
        setState((){
          _currentIndex = index;
        });
      },
    ),

    floatingActionButton: new FloatingActionButton(
      elevation: 0.0,
      child:  Icon(
        
        Icons.add,
        size:45,
        
        ),
      backgroundColor: AppColors.lightBlue,
      onPressed: (){
        _onButtonPressed();
      }
    ),
    );
  }
  void _onButtonPressed(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 45.h,
          width:double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top:20,right: 35,left: 35),
            child: Column(
              children: [
                       DefaultTextField(controller: _branchContainer, hintText: 'Branch'),

                       DefaultTextField(controller: _branchContainer, hintText: 'Phone'),

                      
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    DefaultTextField(controller: _branchContainer, hintText: 'Phone',width:65.w),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,bottom: 7),
                      child: DefaultIconButton(width: 14.7.w, buttonColor: AppColors.darkBlue, iconColor: AppColors.white, icon: Icons.location_on, onTap: (){}),
                    )
                  ],),
       
                
              ],
            ),
          ),

        );
      });
  }
}

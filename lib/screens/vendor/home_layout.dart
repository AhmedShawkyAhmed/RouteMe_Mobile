import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../styles/colors.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text_field.dart';
import 'google_maps_screen.dart';


class HomeLayout extends StatelessWidget {
  
 
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


 

  @override
  Widget build(BuildContext context) {
    //var tasks = AppCubit.get(context).tasks;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state) {
        },
        builder: (BuildContext context,AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return  Scaffold(
          key: scaffoldKey,
           body: cubit.children[cubit.currentIndex],
          
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {

            cubit.changeIndex(index);

            },    
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
      
      ),
        );
        },
      ),
    );
  }
  }
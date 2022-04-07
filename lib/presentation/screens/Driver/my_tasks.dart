import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../widgets/task_card.dart';

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: AppColors.darkBlue,
      leading: Icon(
        Icons.settings,
        size: 32,
      ),
      centerTitle: true,
      title: Text(
        'My Tasks',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ) ,
     body: SingleChildScrollView(
       child: Column(
         children: [
           TaskCard(
     
              task: '#236021',
              client: 'magico',
              order: '625042',
              start: '1:30 PM',
              end: '3 PM',
           ),
             TaskCard(
     
              task: '#236021',
              client: 'magico',
              order: '625042',
              start: '1:30 PM',
              end: '3 PM',
           ),
             TaskCard(
     
              task: '#236021',
              client: 'magico',
              order: '625042',
              start: '1:30 PM',
              end: '3 PM',
           ),
             TaskCard(
     
              task: '#236021',
              client: 'magico',
              order: '625042',
              start: '1:30 PM',
              end: '3 PM',
           ),
           
         ],
       ),
     ),
    );
  }
}

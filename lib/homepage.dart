import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/widgets/add_task.dart';
import 'package:todo/controller/controller.dart';
import 'package:todo/widgets/tasks_list.dart';

import 'widgets/customappbar.dart';

class MyHomePage extends StatelessWidget {
   const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());

        
    return  Scaffold(
        body: GetBuilder<MyController>(builder: (controller) =>
         Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            CustomAppbar(title: "Today Do" ,tasks: controller.tasks),
            Expanded(
             child: Container(
                     padding: const EdgeInsets.all(5),
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20) ,
                        color: Colors.white,
                       ),
                     child:controller.isloading==true? const Center(child: CircularProgressIndicator(),)  
                     :  TasksList()
                     
                   ),
           ),
           ],)

      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
        onPressed: (){    
          Get.bottomSheet(
            BottomSheet(onClosing: (){}, builder:(context)=> const AddTaskScreen())
          );
                 },
      ), 
    );
  }

}







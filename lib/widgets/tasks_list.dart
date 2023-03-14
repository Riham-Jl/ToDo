import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';



class TasksList extends GetView<MyController> {
   const TasksList({super.key});



  @override
  Widget build(BuildContext context) {
     return ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: ((context, i) {
        return ListTile(
        title: Text("${controller.tasks[i]['title']}", style:TextStyle(decoration:  controller.tasks[i]['isdone']=='true'?  TextDecoration.lineThrough : null),),
     trailing: Checkbox(
       value: controller.tasks[i]['isdone']=='true'? true : false, 
     onChanged: (val) {
         controller.changedone(val, i);
      }),
     onLongPress: () {
        controller.deletetask(i);
                          
             }
             
     );}
                
              ),
              );}
}


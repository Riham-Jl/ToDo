import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';


 class AddTaskScreen extends GetView<MyController> {


  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:  Padding(
                  padding: const EdgeInsets.all(50),
                  child: Form(
                    key: controller.formstate,
                    child: Column(
                      children: [
                      Text("Add Task",
                       style: Theme.of(context).textTheme.headline3,),
                      TextFormField(
                        controller: controller.newtask,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Empty";
                          }
                          return null;
                        },
                        autofocus: true,
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(onPressed: () {
                         controller.addtask();
                        }, child: const Text("Add"),
                        )
                    ]),
                  ),
                ),
      )
    ;
  }
}
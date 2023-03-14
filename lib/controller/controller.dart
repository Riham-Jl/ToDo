import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/data/sqldb.dart';

class MyController extends GetxController{
    SqlDb sqldb = SqlDb();
    bool isloading = true;
    List tasks = [];

    TextEditingController? newtask;
     GlobalKey<FormState> formstate =  GlobalKey<FormState>();


Future readdata() async {
    List<Map> response = await sqldb.readData("SELECT * FROM tasks");
    tasks=[];
    tasks.addAll(response);
    isloading=false;
    update();
    }

changedone(val , i) async {
   var response = await sqldb.updateData('''
                      UPDATE tasks SET
                       isdone="$val"
                      WHERE id=${tasks[i]['id']}
                      ''');
   if(response>0){
         readdata();
                 }              
                  
   update();
}

addtask () async{
  var formdata = formstate.currentState;
      if (formdata!.validate()){ 
   int response =await sqldb.insertData('''
                        INSERT INTO tasks ('title')
                        VALUES ("${newtask!.text}")
                        ''');
                           if (response>0){
                            newtask!.clear();
                            readdata();
                          Get.back();
                          }
                          }
                          update();}


deletetask (i) async {
   int response = await sqldb.deleteData("DELETE FROM tasks WHERE id = ${tasks[i]['id']}");
   if (response>0){
      tasks.removeWhere((element) => element['id']==tasks[i]['id']); 
                  }
    update();
}
    @override
  void onInit() {
    newtask = TextEditingController();
    readdata();
    super.onInit();
  }
  }


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db ; 
  
  Future<Database?> get db async {
      if (_db == null){
        _db  = await intialDb() ;
        return _db ;  
      }else {
        return _db ; 
      }
  }


intialDb() async {
  String databasepath = await getDatabasesPath() ; 
  String path = join(databasepath , 'ToDo.db') ;   
  Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1  , onUpgrade:_onUpgrade ) ;  
  return mydb ; 
}

_onCreate(Database db , int version) async {

  Batch batch = db.batch();

   batch.execute('''
  CREATE TABLE "tasks" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "title" TEXT NOT NULL,
    "isdone" BIT default 'FALSE'
  )
 ''') ;

 await batch.commit();

 //print(" onCreate =====================================") ; 

}

_onUpgrade(Database db , int oldversion , int newversion ) async {


 //print("onUpgrade =====================================") ; 
 //await db.execute("ALTER TABLE notes ADD COLUMN title TEXT");
  
}

readData(String sql) async {
  Database? mydb = await db ; 
  List<Map> response = await  mydb!.rawQuery(sql);
  return response ; 
}



insertData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawInsert(sql);
  return response ; 
}


updateData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawUpdate(sql);
  return response ; 
}



deleteData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawDelete(sql);
  return response ; 
}

mydeleteDatabase () async {
  String databasepath = await getDatabasesPath() ; 
  String path = join(databasepath , 'ToDo.db') ;  
  await deleteDatabase(path);
}
 



}

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
    required this.tasks, required this.title,
  }) : super(key: key);

  final List tasks;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children:[
          Row(children: [
    const Icon(Icons.playlist_add_check , size: 40, color: Colors.white,),
    const SizedBox(width: 20,),
    Text(title , style: Theme.of(context).textTheme.headline1)
          ],),
          const SizedBox(height: 10,),

    Text("${tasks.length} Tasks", style: Theme.of(context).textTheme.headline2,),
      const SizedBox(height: 20,),
      ]);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           GestureDetector(
               onTap: (){},
               child:const  Icon(Icons.more_vert)),
          IconButton(onPressed: (){}, icon:const  Icon(Icons.delete)),
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text("ProfileScreen"),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),

      ),
    );
  }
}

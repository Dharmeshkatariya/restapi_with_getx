import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: Text("Add")),
      appBar: AppBar(
        actions: [
          GestureDetector(onTap: () {}, child: const Icon(Icons.more_vert)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text("ProfileScreen"),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.cyan.shade100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

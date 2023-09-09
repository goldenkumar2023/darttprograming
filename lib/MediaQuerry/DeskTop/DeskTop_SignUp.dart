import 'package:flutter/material.dart';

class DeskTopSignUp extends StatefulWidget {
  DeskTopSignUp({Key? key}) : super(key: key);

  @override
  State<DeskTopSignUp> createState() => _DeskTopSignUpState();
}

class _DeskTopSignUpState extends State<DeskTopSignUp> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Row(
          children: [

            SizedBox(
                width:(width * 22)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your First Name"),)),
            SizedBox(width: 10,),
            SizedBox(
                width:(width * 22)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your Middle Name"),)),
            SizedBox(width: 10,),
            SizedBox(
                width:(width * 22)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your Last Name"),)),
            SizedBox(width: 10,),
            SizedBox(
                width:(width * 22)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your email"),)),

          ],
        ),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your phone"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your address"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your password"),),
      ],
    );
  }
}
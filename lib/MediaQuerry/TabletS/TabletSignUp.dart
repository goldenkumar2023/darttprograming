import 'package:flutter/material.dart';

class TabletSignUp extends StatefulWidget {
  TabletSignUp({Key? key}) : super(key: key);

  @override
  State<TabletSignUp> createState() => _TabletSignUpUpState();
}

class _TabletSignUpUpState extends State<TabletSignUp> {
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
                width:(width * 30)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your First Name"),)),
            SizedBox(width: 10,),
            SizedBox(
                width:(width * 30)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your Middle Name"),)),
            SizedBox(
                width:(width * 30)/ 100,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your Last Name"),)),

          ],
        ),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your email"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your phone"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your address"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your password"),),
      ],
    );
  }
}

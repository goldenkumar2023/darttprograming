import 'package:flutter/material.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  State<PhoneSignUp> createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
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
                width:(width/ 2) -10,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your First Name"),)),
            SizedBox(width: 10,),
            SizedBox(
                width:(width/2)-10,
                child: TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your Middle Name"),)),

          ],
        ),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your Last Name"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your email"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your phone"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your address"),),
        TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter Your password"),),
      ],
    );
  }
}

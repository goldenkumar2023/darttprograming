import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Phone/Phone_SignUp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home:getScreen(width) ,
    );
  }

  Widget getScreen(double width){
    if(width <600 ) {
      return  Scaffold(

        backgroundColor:Colors.red,
        body: PhoneSignUp(),
      );
    }
    else if(width <770) {
      return  Scaffold(
        backgroundColor:Colors.grey,
      );
    }
    else{
      return  Scaffold(
        backgroundColor:Colors.yellow,
      );
    }
  }
}

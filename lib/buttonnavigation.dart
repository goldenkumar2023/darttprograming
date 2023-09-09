import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buttonnavigation extends StatefulWidget {
  const buttonnavigation({Key? key}) : super(key: key);

  @override
  State<buttonnavigation> createState() => _buttonnavigationState();
}

class _buttonnavigationState extends State<buttonnavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regx"),
      ),
    );
  }
}

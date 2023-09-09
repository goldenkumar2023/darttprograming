import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicapp/Homepage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  // validate() {
  //   if (name.text.length <= 3) {
  //     Fluttertoast.showToast(msg: "Invalid name");
  //   } else if (!email.text.contains("@gmail.com")) {
  //     Fluttertoast.showToast(msg: "Invalid email");
  //   } else if (phone.text.length < 10) {
  //     Fluttertoast.showToast(msg: "Invalid number");
  //   } else if (address.text.length <= 5) {
  //     Fluttertoast.showToast(msg: "Enter min 5 characters");
  //   } else if (password.text.length <= 4) {
  //     Fluttertoast.showToast(msg: "Enter min 4 characters");
  //   } else {
  //     emailAuth();
  //   }
  // }

  emailAuth() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((value) {
      userdata();
    });
  }

  userdata() {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection("users").doc(auth).set({
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "address": address.text,
      "password": password.text,
    }).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Registered',
            style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Center(
                child: Text(
                  'R E G I S T E R H E R E',
                  style: TextStyle(color: Colors.blue, fontSize: 35),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'REGISTERED',
                  style: TextStyle(color: Colors.blue, fontSize: 36),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: ('Enter name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: ('Enter email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                    labelText: ('Enter phone'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                controller: address,
                decoration: InputDecoration(
                    labelText: ('Enter Address'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 30),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: ('Enter password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: SizedBox(
                  width: 300,
                  height: 37,
                  child: ElevatedButton(
                    onPressed: () {
                      emailAuth();
                    },
                    child: const Text("Submit"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

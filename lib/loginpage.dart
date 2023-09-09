import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicapp/Homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  userLogin() async {
    var mAuth = FirebaseAuth.instance;
    try {
      await mAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Fluttertoast.showToast(
          msg: "Login Successful ", textColor: Colors.yellowAccent);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Homepage()));
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid email and password");
    }

  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LOGIN PAGE",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Simple login page',
            style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Center(
                child: Text(
                  'LOGIN PAGE',
                  style: TextStyle(color: Colors.blue, fontSize: 35),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'login',
                  style: TextStyle(color: Colors.blue, fontSize: 36),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: ('Enter Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35)),
                  hintText: ('Enter Email'),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: ('Enter Password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    hintText: ('Enter Password')),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 100, left: 100),
              child: SizedBox(
                width: 300,
                height: 37,
                child: ElevatedButton(
                  onPressed: () {
                    userLogin();
                   },
                  child: const Text('login'),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      )),
                  child: const Text(
                    'Dont Have an Account?Sing up',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

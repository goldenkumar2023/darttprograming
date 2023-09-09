import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'enterotp.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {

  TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: "Enter your Phone Number"
              ),
            ),
          ),

          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${phoneController.text}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      PhoneNumber.verify=verificationId;

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PhoneAuth(),));
                      Fluttertoast.showToast(msg: "Sent OTP");
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
                catch(e){
                  Fluttertoast.showToast(msg: "OTP Failed");
                }
              },
              child: const Text("Send Otp")
          )
        ],
      ),
    );
  }
}
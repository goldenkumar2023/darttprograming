import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutterbasicapp/login_withemail.dart';
// import 'package:flutterbasicapp/profile.dart';
// import 'package:flutterbasicapp/splashscreen.dart';

import 'Api_colling/Get_Userdata.dart';

import 'firebase_options.dart';
import 'future_builder/Streem_builder/Fatch_data.dart';
import 'future_builder/get_Data.dart';
// import 'googleAuth/google auth.dart';
// import 'googlemap/current_location.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const homePage1());
}

class homePage1 extends StatelessWidget {
  const homePage1({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
         home: UserList(),
      // home: ProductListPage(),
        //homeome: splashscreen(),
        //home: login_withemail(),
      // home: Currentlocation(),

        );


  }
}




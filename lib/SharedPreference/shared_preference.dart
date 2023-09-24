// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreference extends StatefulWidget {
//   const SharedPreference({Key? key}) : super(key: key);
//
//   @override
//   State<SharedPreference> createState() => _SharedPreferenceState();
//
//   static Future<SharedPreference> getInstance() async {
//     final instance = SharedPreference();
//     await instance.init(); // Initialize your SharedPreferences instance here
//     return instance;
//   }
//
//   setValue(String s, String t) {}
//
//   init() {}
// }
//
// class _SharedPreferenceState extends State<SharedPreference> {
//   late String savedValue = "";
//
//   Future<void> init() async {
//     // Initialize SharedPreferences or load your data here
//     final prefs = await SharedPreferences.getInstance();
//     savedValue = prefs.getString("key") ?? "";
//   }
//
//   Future<void> setValue(String key, String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(key, value);
//     setState(() {
//       savedValue = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shared Preference Example"),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 final SP = await SharedPreference.getInstance();
//                 await SP.setValue("age", "25");
//                      SP.se
//                 },
//               child: Text("Add Data"),
//             ),
//             Text("Saved Value: $savedValue"),
//           ],
//         ),
//       ),
//     );
//   }
// }
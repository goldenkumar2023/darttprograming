import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/get_model.dart';
import '../Model/post_model.dart';

class Postmethod extends StatefulWidget {
  const Postmethod({Key? key}) : super(key: key);

  @override
  State<Postmethod> createState() => _PostmethodState();
}

class _PostmethodState extends State<Postmethod> {
  GetApiModel? getApiModel;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://manage.chaalakya.com/api/c-enquiry-list-client'),
      headers: {
        "response": " response",
        "message": "message",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        getApiModel = GetApiModel.fromJson(responseData);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel List'),
      ),
      body: getApiModel != null
          ? ListView.builder(
        itemCount: getApiModel!.sr.length,
        itemBuilder: (context, index) {
          final location = getApiModel!.sr[index];
          return ListTile(
            title: Text(location.regionNames.displayName),
            subtitle: Text(location.regionNames.primaryDisplayName),
            trailing: const Icon(Icons.location_on),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
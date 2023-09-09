import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import '../Model/get_model.dart';


class HotelScreen extends StatefulWidget {
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  HotelsModels? hotelData;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://hotels4.p.rapidapi.com/locations/v3/search?q=new york&locale=en_US&langid=1033&siteid=300000001'),
      headers: {
        "X-RapidAPI-Host": "hotels4.p.rapidapi.com",
        "X-RapidAPI-Key": "e4adbd2933msh1c2983cc6c7081bp1bf54bjsn1665c629ea60",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        hotelData = HotelsModels.fromJson(responseData);
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
      body:  hotelData != null
          ?ListView.builder(
        itemCount: hotelData!.sr.length,
        itemBuilder: (context, index) {
          final location = hotelData!.sr[index];
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
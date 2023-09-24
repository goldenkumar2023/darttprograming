import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/apimodels.dart';

class UserList extends StatefulWidget {
  UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  get http => null;


  @override
  void initState() {
    super.initState();
    // Call your API function here to fetch data.
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<PgModels> userList =
        pgModelsFromJson(utf8.decode(response.bodyBytes));
        setState(() {
         var PgModel = PgModels;
        });
      } else {
        throw Exception(
            ' userId',

        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _searchQuery = _searchController.text.toLowerCase();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 5, // Add elevation for a card-like effect
              child: ListTile(
                leading: Icon(Icons.search), // Search icon
                title: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for a user by name',
                    border: InputBorder.none, // Remove the border
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.clear), // Clear icon for text field
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _searchQuery = '';
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  // Filter the user list based on the search query
                  final filteredUsers = documents.where((document) {
                    final userData = document.data() as Map<String, dynamic>;
                    final String name = userData['name']?.toString()?.toLowerCase() ?? '';
                    return name.contains(_searchQuery);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final userData = filteredUsers[index].data() as Map<String, dynamic>;
                      final String name = userData['name'] ?? '';
                      final String phoneNumber = userData['phone'] ?? '';

                      return ListTile(
                        title: Text(name),
                        subtitle: Text(phoneNumber),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

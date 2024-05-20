import 'package:flutter/material.dart';
import 'package:adhyayan/widgets/profilemenu.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';
import 'bookshared_screen.dart';

var uname;
var uid;

class ProfileScreen extends StatelessWidget {
  String? userid;
  String? username;
  Future<Map<String, String>> fetchUserDetails(BuildContext context) async {
    final userId = Provider.of<Auth>(context, listen: false).user;
    userid = userId;
    uid = userid;
    if (userId != null) {
      final url = Uri.https(
          'adhyayan-90a7e-default-rtdb.firebaseio.com', 'users/$userId.json');
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final userMap = responseData.values.first as Map<String, dynamic>;
        final name = userMap['name'];
        final email = userMap['email'];
        print(name);
        uname = name;
        return {'name': name, 'email': email};
      } else {
        throw Exception('Failed to load user details');
      }
    } else {
      throw Exception('User ID not available');
    }
  }

  String? get userName => username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<Map<String, String>>(
          future: fetchUserDetails(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final userDetails = snapshot.data!;
              return Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/rohit.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userDetails['name']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userDetails['email']!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Upgrade to PRO',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          ProfileMenuItem(
                            icon: Icons.book_outlined,
                            text: 'Book Shelf',
                            onTap: () {
                              // Navigate to Book Shelf screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookSharedScreen()),
                              );
                            },
                          ),
                          ProfileMenuItem(
                            icon: Icons.people,
                            text: 'Friends',
                            onTap: () {
                              // Navigate to Friends screen
                            },
                          ),
                          // Other menu items...
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

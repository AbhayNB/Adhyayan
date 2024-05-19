import 'package:adhyayan/screens/bookshared_screen.dart';
import 'package:flutter/material.dart';
import 'package:adhyayan/widgets/profilemenu.dart';

class ProfileScreen extends StatelessWidget {
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
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('assets/images/rohit.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Rohit Sharma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'sharmajikabeta@gmail.com',
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
                      text: 'Book Shared',
                      onTap: () {
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
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.help,
                      text: 'Help & Support',
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.settings,
                      text: 'Settings',
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.person_add,
                      text: 'Invite a Friend',
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.logout,
                      text: 'Logout',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

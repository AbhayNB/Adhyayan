import 'package:adhyayan/screens/bookshared_screen.dart';
import 'package:flutter/material.dart';
import 'package:adhyayan/widgets/profilemenu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('assets/images/rohit.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Rohit Sharma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'sharmajikabeta@gmail.com',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Upgrade to PRO',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    ProfileMenuItem(
                      icon: Icons.book_outlined,
                      text: 'Book Shelf',
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

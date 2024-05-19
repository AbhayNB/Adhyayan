// import 'package:adhyayan/screens/category_screen.dart';
import 'package:adhyayan/screens/add_book.dart';
import 'package:adhyayan/screens/books_screen.dart';
import 'package:adhyayan/screens/login.dart';
import 'package:adhyayan/screens/profile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const BookScreen(), // Bookstore screen
    const AddBookScreen(), // Add screen
    const Scaffold(body: Center(child: Text('No Messages Yet'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adhyayan',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: const Icon(Icons.login_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: const Icon(Icons.perm_identity_sharp),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'BookStore',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.star_border_outlined),
          //   label: 'Star',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor:
          Theme.of(context).primaryColor, // Set the background color
        currentIndex: _currentIndex, // Set the initial selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

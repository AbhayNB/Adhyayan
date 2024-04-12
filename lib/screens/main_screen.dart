// import 'package:adhyayan/screens/category_screen.dart';
import 'package:adhyayan/screens/add_book.dart';
import 'package:adhyayan/screens/books_screen.dart';
import 'package:adhyayan/screens/login.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    // Replace these with your actual screen widgets
    const BookScreen(), // Bookstore screen
    const AddBookScreen(), // Add screen
    Placeholder(), // Messages screen
    // Placeholder(), // Search screen
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
            icon: const Icon(Icons.person_pin),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
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

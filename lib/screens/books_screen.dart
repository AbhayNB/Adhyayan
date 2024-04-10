import 'package:adhyayan/screens/category_screen.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Books',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true, // Set to true to enable filling
                fillColor: Colors.white, // Set the background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none, // Hide the border
                ),
              ),
              onChanged: (value) {
                // Handle search text change
              },
            ),
            const SizedBox(height: 16.0), // Spacer

            ElevatedButton(
              onPressed: () {
                // Navigate to category selection screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const CategoryScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose By Category',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

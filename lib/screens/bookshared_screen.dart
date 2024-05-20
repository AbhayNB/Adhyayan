import 'package:flutter/material.dart';
import 'package:adhyayan/models/dummy_book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'profile.dart';
// Ensure you have the current user ID set here

class BookSharedScreen extends StatefulWidget {
  @override
  _BookSharedScreenState createState() => _BookSharedScreenState();
}

class _BookSharedScreenState extends State<BookSharedScreen> {
  List<Book> booksShared = [];

  @override
  void initState() {
    super.initState();
    fetchAndSetProducts();
  }

  Future<void> fetchAndSetProducts() async {
    var url = Uri.https(
        'adhyayan-90a7e-default-rtdb.firebaseio.com', 'booksforrent.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Book> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        if ((prodData['id'] == uid) || (prodData['by'] == uname)) {
          // Check if the book belongs to the current user
          loadedProducts.add(Book(
            name: prodData['title'],
            image: "assets/images/car2.jpg",
            author: prodData['author'],
            rating: '4.8',
            reviews: '190',
            isLiked: false,
            renterName: prodData['by'],
            weeklyPrice: '0.00',
            monthlyPrice: prodData['price'],
          ));
        }
      });
      setState(() {
        booksShared = loadedProducts;
      });
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mine'),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Loaned'),
              Tab(text: 'Purchased'),
            ],
          ),
        ),
        body: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              buildBookListView(booksShared), // Loaned books
              buildBookListView(
                  booksShared), // Available books (for now using the same list)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBookListView(List<Book> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Number of Books Shared: ${books.length}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[850],
                child: InkWell(
                  onTap: () {
                    // Handle book tap here
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "assets/images/car2.jpg",
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      book.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.author,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.person,
                                size: 16, color: Colors.grey[400]),
                            const SizedBox(width: 5),
                            Text(
                              book.renterName,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.yellow),
                            const SizedBox(width: 5),
                            Text(
                              book.rating.toString(),
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '(${book.reviews} reviews)',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.currency_rupee,
                                size: 16, color: Colors.grey[400]),
                            const SizedBox(width: 5),
                            Text(
                              'Weekly: \$${book.weeklyPrice}',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Monthly: \$${book.monthlyPrice}',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

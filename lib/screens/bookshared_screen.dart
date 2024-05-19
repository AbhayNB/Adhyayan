import 'package:flutter/material.dart';
import 'package:adhyayan/models/dummy_book.dart';

class BookSharedScreen extends StatelessWidget {
  final List<Book> booksShared = [
    Book(
    name: "Harry Potter and the Sorcerer's Stone",
    image: "assets/images/harryPorter.jpg",
    author: "J.K. Rowling",
    rating: 4.9,
    reviews: 200,
    isLiked: true,
    renterName: "Chris Roberts",
    weeklyPrice: 10.99,
    monthlyPrice: 39.99,
  ),
    Book(
    name: "Sapiens: A Brief History of Humankind",
    image: "assets/images/sapiens.jpeg",
    author: "Yuval Noah Harari",
    rating: 4.8,
    reviews: 190,
    isLiked: false,
    renterName: "Laura Thompson",
    weeklyPrice: 9.99,
    monthlyPrice: 37.99,
  ),
    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mine'),
          backgroundColor: Colors.black,
          // centerTitle: true,
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
              buildBookListView(booksShared), // Available books (for now using the same list)
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
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
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
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[850],
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Image.network(
                    book.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    book.name,
                    style: TextStyle(
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
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.person, size: 16, color: Colors.grey[400]),
                          SizedBox(width: 5),
                          Text(
                            book.renterName,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ],
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

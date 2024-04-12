import 'package:adhyayan/models/dummy_book.dart';
import 'package:flutter/material.dart';
import 'package:adhyayan/models/category.dart';


// List of available book categories
List<BookCategory> availableBookCategories = [
  BookCategory(
    id: 'b1',
    title: 'Fiction',
    color: Colors.deepPurple,
  ),
  BookCategory(
    id: 'b2',
    title: 'Mystery',
    color: Colors.red,
  ),
  BookCategory(
    id: 'b3',
    title: 'Romance',
    color: Colors.pink,
  ),
  BookCategory(
    id: 'b4',
    title: 'Fantasy',
    color: Colors.blue,
  ),
  BookCategory(
    id: 'b5',
    title: 'Science Fiction',
    color: Colors.teal,
  ),
  BookCategory(
    id: 'b6',
    title: 'Thriller',
    color: const Color.fromARGB(255, 74, 78, 205),
  ),
  BookCategory(
    id: 'b7',
    title: 'Biography',
    color: Colors.green,
  ),
  BookCategory(
    id: 'b8',
    title: 'History',
    color: Colors.brown,
  ),
  BookCategory(
    id: 'b9',
    title: 'Self-help',
    color: Colors.orange,
  ),
  BookCategory(
    id: 'b10',
    title: 'Cooking',
    color: Colors.amber,
  ),
  BookCategory(
    id: 'b11',
    title: 'Philosophy',
    color: const Color.fromARGB(255, 11, 93, 125),
  ),
  BookCategory(
    id: 'b12',
    title: 'Horror',
    color: const Color.fromARGB(255, 104, 16, 72),
  ),
  BookCategory(
    id: 'b13',
    title: 'Business & Finance',
    color: const Color.fromARGB(255, 36, 18, 197),
  ),
  BookCategory(
    id: 'b14',
    title: 'Poetry',
    color: const Color.fromARGB(255, 16, 109, 81),
  ),
];


final List<Book> books = [
  Book(
    name: "To Kill a Mockingbird",
    image: 'assets/images/to_kill_a_mockingbird.jpeg',
    author: "Harper Lee",
    rating: 4.5,
    reviews: 120,
    isLiked: true,
    renterName: "John Doe",
    weeklyPrice: 0.99,
    monthlyPrice: 3.99,
  ),
  Book(
    name: "1984",
    image: "assets/images/1984.jpeg",
    author: "George Orwell",
    rating: 4.8,
    reviews: 150,
    isLiked: false,
    renterName: "Jane Smith",
    weeklyPrice: 12.99,
    monthlyPrice: 49.99,
  ),
  Book(
    name: "Pride and Prejudice",
    image: "assets/images/pride_prej.jpeg",
    author: "Jane Austen",
    rating: 4.7,
    reviews: 180,
    isLiked: true,
    renterName: "Michael Johnson",
    weeklyPrice: 9.99,
    monthlyPrice: 34.99,
  ),
  Book(
    name: "The Great Gatsby",
    image: "assets/images/the_great_gatsby.jpeg",
    author: "F. Scott Fitzgerald",
    rating: 4.6,
    reviews: 160,
    isLiked: false,
    renterName: "Emily Brown",
    weeklyPrice: 11.99,
    monthlyPrice: 44.99,
  ),
  Book(
    name: "To the Lighthouse",
    image: "assets/images/to_the_lighthouse.jpeg",
    author: "Virginia Woolf",
    rating: 4.3,
    reviews: 110,
    isLiked: false,
    renterName: "David Wilson",
    weeklyPrice: 8.99,
    monthlyPrice: 29.99,
  ),
];

final List<Book> popularBooks = [
  Book(
    name: "The Catcher in the Rye",
    image: 'assets/images/catcher.jpeg',
    author: "J.D. Salinger",
    rating: 4.4,
    reviews: 130,
    isLiked: true,
    renterName: "Alice Johnson",
    weeklyPrice: 7.99,
    monthlyPrice: 27.99,
  ),
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
  Book(
    name: "The Alchemist",
    image: "assets/images/alchemist.jpeg",
    author: "Paulo Coelho",
    rating: 4.5,
    reviews: 150,
    isLiked: true,
    renterName: "Mark Davis",
    weeklyPrice: 10.99,
    monthlyPrice: 42.99,
  ),
];

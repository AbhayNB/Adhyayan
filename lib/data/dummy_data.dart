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
    image: 'assets/images/1984.jpeg',
    author: "Harper Lee",
    rating: 4.5,
    reviews: 120,
    isLiked: true,
  ),
  Book(
    name: "1984",
    image: "assets/images/1984.jpg",
    author: "George Orwell",
    rating: 4.8,
    reviews: 150,
    isLiked: false,
  ),
  Book(
    name: "Pride and Prejudice",
    image: "assets/images/pride-and-prejudice.jpg",
    author: "Jane Austen",
    rating: 4.7,
    reviews: 180,
    isLiked: true,
  ),
  Book(
    name: "The Great Gatsby",
    image: "assets/images/the-great-gatsby.jpg",
    author: "F. Scott Fitzgerald",
    rating: 4.6,
    reviews: 160,
    isLiked: false,
  ),
  Book(
    name: "Moby Dick",
    image: "assets/images/moby-dick.jpg",
    author: "Herman Melville",
    rating: 4.4,
    reviews: 130,
    isLiked: true,
  ),
  Book(
    name: "To the Lighthouse",
    image: "assets/images/to-the-lighthouse.jpg",
    author: "Virginia Woolf",
    rating: 4.3,
    reviews: 110,
    isLiked: false,
  ),
];


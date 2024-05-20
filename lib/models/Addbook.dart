import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class BookForRent with ChangeNotifier {
  final String id;
  final String title;
  final String author;
  final String isbn;
  final String genre;
  final String description;
  final String condition;
  // final List<String> photos;
  final String price;
  final String contact;
  final String location;
  final String uploadedby;
  BookForRent({
    required this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.genre,
    required this.description,
    required this.condition,
    // required this.photos,
    required this.price,
    required this.contact,
    required this.location,
    required this.uploadedby,
  });
}

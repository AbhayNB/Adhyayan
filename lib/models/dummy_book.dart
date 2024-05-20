import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Book with ChangeNotifier {
  String name;
  String image;
  String author;
  String rating;
  String reviews;
  bool isLiked;
  String renterName; // New property for renter's name
  String weeklyPrice; // New property for weekly rental price
  String monthlyPrice; // New property for monthly rental price

  Book({
    required this.name,
    required this.image,
    required this.author,
    required this.rating,
    required this.reviews,
    required this.isLiked,
    required this.renterName,
    required this.weeklyPrice,
    required this.monthlyPrice,
  });
}

class Book {
  String name;
  String image;
  String author;
  double rating;
  int reviews;
  bool isLiked;
  String renterName; // New property for renter's name
  double weeklyPrice; // New property for weekly rental price
  double monthlyPrice; // New property for monthly rental price

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

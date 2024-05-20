import 'package:adhyayan/data/dummy_data.dart';
import 'package:adhyayan/screens/category_screen.dart';
import 'package:adhyayan/widgets/category_grid_item.dart';
import 'package:adhyayan/widgets/horizontal_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:adhyayan/data/dummy_data.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../data/dummy_data.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final List<String> bannerImages = [
    'assets/images/car1.jpg',
    'assets/images/car2.jpg',
    'assets/images/car3.jpg',
    'assets/images/car4.jpg',
    // Add more banner image paths here
  ];

  int _currentSlide = 0;
  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    fetchAndSetProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            const SizedBox(height: 16.0),

            CarouselSlider(
              items: bannerImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                  });
                },
                autoPlayInterval: const Duration(seconds: 3),
              ),
            ),

            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
            // Heading for Trending section
            Row(
              children: [
                const Text(
                  'Trending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'See All >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Horizontal slider for trending books
            HorizontalSliderItem(books: books),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 160, // Adjust height as needed
            ),

            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 20.0),
            //   padding: const EdgeInsets.all(16.0),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: const Text(
            //     'Special Offer: Buy 2 Get 1 Free!',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // )

            // Heading for Most Popular section
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text(
                  'All Books',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16.0, // Spacing between columns
              mainAxisSpacing: 16.0, // Spacing between rows
              childAspectRatio: 0.63, // Width to height ratio of each item

              // Generate grid items based on books list
              children: popularBooks.map((popularBooks) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            popularBooks.image,
                            width:
                                double.infinity, // Fit image to container width
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularBooks.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'by ${popularBooks.author}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  Text(
                                    '${popularBooks.rating}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '(${popularBooks.reviews} reviews)',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Available for rent from:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${popularBooks.renterName}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Weekly Price: \$${popularBooks.weeklyPrice}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Monthly Price: \$${popularBooks.monthlyPrice}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

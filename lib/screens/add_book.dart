import 'package:adhyayan/models/Addbook.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _isbnController;
  late TextEditingController _genreController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _contactController;
  late TextEditingController _locationController;

  String _condition = 'New';
  List<String> _photos = [];
  String _selectedGenre = 'Fiction'; // Initial selected genre

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _authorController = TextEditingController();
    _isbnController = TextEditingController();
    _genreController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _contactController = TextEditingController();
    _locationController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _isbnController.dispose();
    _genreController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _contactController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed to submit data
      String title = _titleController.text;
      String author = _authorController.text;
      String isbn = _isbnController.text;
      String genre = _genreController.text;
      String description = _descriptionController.text;
      String price = _priceController.text;
      String contact = _contactController.text;
      String location = _locationController.text;

      // Construct Book object with entered data
      BookForRent add_book = BookForRent(
        title: title,
        author: author,
        isbn: isbn,
        genre: genre,
        description: description,
        condition: _condition,
        photos: _photos,
        price: price,
        contact: contact,
        location: location,
      );

      // Add logic here to handle book submission
      // For example, save to database or send to API
      // Reset form after submission
      _formKey.currentState!.reset();
    }
  }

  Future<void> _selectPhotos() async {
    final ImagePicker _picker = ImagePicker();

    // Launch the image picker to select images from the device
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Handle selected image
      // Here you can process the selected image (e.g., display, upload, etc.)
      // Example: display the selected image using Image.file widget
      // Example: upload the selected image to a server
    } else {
      // User canceled the image selection
      // Handle cancellation (e.g., show a message or perform specific action)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book for Rent'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Book Title',
                  prefixIcon: const Icon(Icons.book, color: Colors.white),
                  hintText: 'Sapiens',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the book title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Author',
                  prefixIcon: const Icon(Icons.person, color: Colors.white),
                  hintText: 'Noah Harari',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _isbnController,
                decoration: InputDecoration(
                  labelText: 'ISBN',
                  prefixIcon: const Icon(Icons.book, color: Colors.white),
                  hintText: '978-1-4028-9462-6',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField<String>(
                value: _selectedGenre,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGenre = newValue ?? '';
                  });
                },
                items: [
                  'Fiction',
                  'Non-fiction',
                  'Mystery',
                  'Thriller',
                  'Romance'
                ].map((String genre) {
                  return DropdownMenuItem<String>(
                    value: genre,
                    child: Text(
                      genre,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Genre',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _condition,
                onChanged: (newValue) {
                  setState(() {
                    _condition = newValue ?? '';
                  });
                },
                items: <String>['New', 'Like New', 'Good', 'Acceptable']
                    .map((String condition) {
                  return DropdownMenuItem<String>(
                    value: condition,
                    child: Text(
                      condition,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Condition',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  // color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              _selectPhotos();
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                children: [
                                  Icon(Icons.add_photo_alternate,
                                      color: Colors.white),
                                  Text('Add Photos',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _submitForm,
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                children: [
                                  Icon(Icons.send, color: Colors.white),
                                  Text('Submit',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

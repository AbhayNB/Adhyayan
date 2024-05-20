import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import '../widgets/animated_text.dart';
import '../providers/auth.dart';
import 'main_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isSubmitting = false;
  String _selectedLocation = 'City 1';
  String _errorMessage = '';

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isSubmitting = true;
      _errorMessage = '';
    });
    try {
      await Provider.of<Auth>(context, listen: false).signup(
        emailController.text,
        passwordController.text,
      );

      final userId = Provider.of<Auth>(context, listen: false).user;

      if (userId != null) {
        var url = Uri.https(
            'adhyayan-90a7e-default-rtdb.firebaseio.com', 'users/$userId.json');
        print("start");
        var response = await http.post(
          url,
          body: json.encode({
            'name': nameController.text,
            'email': emailController.text,
            'location': _selectedLocation,
          }),
        );
      }
      // Navigate to the next screen upon successful signup
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => MainScreen()),
      // );
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      const errorMessage = 'Could not sign you up. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              AnimatedWelcomeText(value: "Welcome to Adhyayan!"),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Location'),
                      value: _selectedLocation,
                      items: ['City 1', 'City 2', 'City 3', 'City 4', 'City 5']
                          .map((city) => DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    if (_isSubmitting) CircularProgressIndicator(),
                    if (!_isSubmitting)
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text('Sign Up'),
                      ),
                    if (_errorMessage.isNotEmpty)
                      Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import 'signup.dart';
import '../widgets/animated_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(); // Changed to emailController
  final passwordController = TextEditingController();
  bool _isSubmitting = false;
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
      await Provider.of<Auth>(context, listen: false).login(
        emailController.text, // Changed to emailController
        passwordController.text,
      );
      // Navigate to the next screen upon successful login
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
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
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              AnimatedWelcomeText(value: "Welcome Back!"),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController, // Changed to emailController
                      decoration:
                          InputDecoration(labelText: 'Email'), // Changed label
                      keyboardType:
                          TextInputType.emailAddress, // Changed to email
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email'; // Updated error message
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
                    if (_isSubmitting) CircularProgressIndicator(),
                    if (!_isSubmitting)
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text('Login'),
                      ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle "Forgot password?" link
                          },
                          child: Text('Forgot Password?'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ));
                          },
                          child: Text('Sign Up'),
                        ),
                      ],
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

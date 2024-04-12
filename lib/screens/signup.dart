import 'package:adhyayan/widgets/animated_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AnimatedWelcomeText(
              value: "Welcome to Adhyayan!",
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          // controller:,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Location',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                          value: 'City 1',
                          // style: TextStyle(color: Colors.white),
                          items: [
                            DropdownMenuItem(
                              value: 'City 1',
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('City 1', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'City 2',
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('City 2', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'City 3',
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('City 3', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'City 4',
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('City 4', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'City 5',
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('City 5', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            // Handle location change here
                          },
                        ),
                        const SizedBox(height: 16),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.blue),
                            //     borderRadius: BorderRadius.circular(8.0),
                            //   ),
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 16,
                            //     vertical: 8,
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       InkWell(
                            //         onTap: () {
                            //           // Handle "Forgot password?" link here
                            //         },
                            //         child: const Text(
                            //           'Reset password',
                            //           style: TextStyle(color: Colors.blue),
                            //         ),
                            //       ),
                            //       const SizedBox(width: 16),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child:  InkWell(
                                    onTap: () {
                                      // Handle "Sign up" link here
                                    },
                                    child: const Text(
                                      'Sign up',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                            ),
                        //   ],
                        // ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

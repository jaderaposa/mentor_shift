import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/custom_button.dart';

class Register extends StatefulWidget {
 const Register({super.key});

 @override
 RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
 Map data = {};

 @override
 void initState() {
    super.initState();
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0080B7), // Top color
              Color(0xFF0B8274), // Bottom color
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                 'images/mentorshiftorig.png',
                 width: double.infinity, // Make the image take the full width
                 height: 120, // Keep the height fixed or adjust as needed
                 fit: BoxFit.contain, // Scale the image to fit within the bounds
                ),
                const Text(
                 'Mentor-Shift',
                 style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'ProtestRiot',
                    color: Colors.white,
                 ),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(48, 20, 48, 0),
                 child: Column(
                    children: <Widget>[
                      const Row(
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 20, // Adjust the font size as needed
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.white,
                              fontFamily: 'ProtestRiot', // Set the text color
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Email input
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'ProtestRiot', // Apply ProtestRiot font to label
                              color: Color(0xFF076A89),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none, // Remove the default border
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontFamily: 'ProtestRiot', // Apply ProtestRiot font to input text
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password input
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontFamily: 'ProtestRiot', // Apply ProtestRiot font to label
                              color: Color(0xFF076A89),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none, // Remove the default border
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                          ),
                          obscureText: true,
                          style: const TextStyle(
                            fontFamily: 'ProtestRiot', // Apply ProtestRiot font to input text
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Confirm Password input
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              fontFamily: 'ProtestRiot', // Apply ProtestRiot font to label
                              color: Color(0xFF076A89),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none, // Remove the default border
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                          ),
                          obscureText: true,
                          style: const TextStyle(
                            fontFamily: 'ProtestRiot', // Apply ProtestRiot font to input text
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        text: 'SIGN UP',
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // Navigate to sign-up page
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SignUpPage()),
                          // );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text:
                                    'Already have an account?\n', // Add a newline character here
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ProtestRiot',
                                ),
                              ),
                              const TextSpan(
                                text:
                                    '\n', // Use a newline character to create space
                                style: TextStyle(
                                    height:
                                        0.5), // Adjust the height to control the space
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 15.0,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to login page
                                    Navigator.pushNamed(context, '/login');
                                  },
                              ),
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
        ),
      ),
    );
  }
}

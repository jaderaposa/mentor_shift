import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/style/paddedcontainer.dart';
import 'package:mentor_shift/pages/register1.dart';
import 'package:mentor_shift/objects/backbutton.dart';

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
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        onBackButtonPress: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
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
                            width: double
                                .infinity, // Make the image take the full width
                            height:
                                120, // Keep the height fixed or adjust as needed
                            fit: BoxFit
                                .contain, // Scale the image to fit within the bounds
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
                            padding: const EdgeInsets.fromLTRB(48, 50, 48, 0),
                            child: Column(
                              children: <Widget>[
                                const Row(
                                  children: [
                                    Text(
                                      'Welcome to Mentor-Shift!\nFirst, let\'s create an account.',
                                      style: TextStyle(
                                        fontSize:
                                            20, // Adjust the font size as needed
                                        fontWeight: FontWeight
                                            .bold, // Make the text bold
                                        color: Colors.white,
                                        fontFamily:
                                            'ProtestRiot', // Set the text color
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Email input
                                PaddedContainer(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [kBoxShadow],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          fontFamily:
                                              'ProtestRiot', // Apply ProtestRiot font to label
                                          color: Color(0xFF076A89),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder
                                            .none, // Remove the default border
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 15.0),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        fontFamily:
                                            'ProtestRiot', // Apply ProtestRiot font to input text
                                      ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 20),
                                // Password input
                                PaddedContainer(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [kBoxShadow],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          fontFamily:
                                              'ProtestRiot', // Apply ProtestRiot font to label
                                          color: Color(0xFF076A89),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder
                                            .none, // Remove the default border
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 15.0),
                                      ),
                                      obscureText: true,
                                      style: const TextStyle(
                                        fontFamily:
                                            'ProtestRiot', // Apply ProtestRiot font to input text
                                      ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 20),
                                // Confirm Password input
                                PaddedContainer(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [kBoxShadow],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Confirm Password',
                                        labelStyle: TextStyle(
                                          fontFamily:
                                              'ProtestRiot', // Apply ProtestRiot font to label
                                          color: Color(0xFF076A89),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder
                                            .none, // Remove the default border
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 15.0),
                                      ),
                                      obscureText: true,
                                      style: const TextStyle(
                                        fontFamily:
                                            'ProtestRiot', // Apply ProtestRiot font to input text
                                      ),
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
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // Navigate to the next sequence of the registration
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register1()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Change this to the color you want
                padding: const EdgeInsets.symmetric(
                    vertical:
                        20.0), // Increase the vertical padding to make the button taller
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProtestRiot',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

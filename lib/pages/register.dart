import 'package:flutter/material.dart';
import 'package:mentor_shift/classes/user.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Positioned(
                          top: 50, // Adjust as needed
                          left: 50, // Adjust as needed
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/icons/mentorshiftorig.png',
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
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              children: <Widget>[
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start, // Add this line
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Welcome to Mentor-Shift!',
                                          style: TextStyle(
                                            fontSize:
                                                20, // Adjust the font size as needed
                                            color: Colors.white,
                                            fontFamily:
                                                'ProtestRiot', // Set the text color
                                          ),
                                        ),
                                        Text(
                                          'First, let\'s create an account',
                                          style: TextStyle(
                                            fontSize:
                                                20, // Adjust the font size as needed
                                            color: Colors.white,
                                            fontFamily:
                                                'ProtestRiot', // Set the text color
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '1/4',
                                      style: TextStyle(
                                        fontSize:
                                            40, // Adjust the font size as needed
                                        fontWeight: FontWeight
                                            .bold, // Make the text bold
                                        color: Colors.white,
                                        fontFamily:
                                            'ProtestRiot', // Set the text color
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
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
                                      controller: emailController,
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
                                      controller: passwordController,
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
                                      controller: confirmPasswordController,
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
                        ),
                      ],
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
                // Check if the password and confirm password match
                if (passwordController.text == confirmPasswordController.text) {
                  // If they match, update RegistrationData and navigate
                  RegistrationData().setData(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register1()),
                  ); // Added missing semicolon here
                } else {
                  // If they don't match, show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Passwords do not match.')), // Added 'const' keyword here
                  ); // Added missing parenthesis here
                }
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/custom_button.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/style/paddedcontainer.dart';
import 'package:mentor_shift/pages/register.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Handle the login button press
  void _handleLoginButtonPress() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Basic validation
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return; // Exit the method if validation fails
    }

    try {
      // Attempt to log in and handle any exceptions with more descriptive messages
      await _authService.loginUser(email, password);
      // Navigate to another screen upon successful login
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Role()), // Adjust as needed
        );
      }
    } catch (error) {
      // Display error message based on the type of exception
      String errorMessage = error.toString();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Mentor Shift'),
      //   centerTitle: true,
      //   backgroundColor: Colors.green[800],
      //   elevation: 0.0,
      //   titleTextStyle: const TextStyle(
      //     color: Colors.white, // Set title color to white
      //     fontSize: 30.0, // Set title font size
      //     fontFamily: 'ProtestRiot',
      //   ),
      // ),
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
                  'images/icons/mentorshiftorig.png',
                  width: double.infinity, // Make the image take the full width
                  height: 120, // Keep the height fixed or adjust as needed
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
                            'Login Account',
                            style: TextStyle(
                              fontSize: 20, // Adjust the font size as needed
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.white,
                              fontFamily: 'ProtestRiot', // Set the text color
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontFamily:
                                    'ProtestRiot', // Apply ProtestRiot font to label
                                color: Color(0xFF076A89),
                              ),
                              // prefixIcon: Icon(Icons.mail),
                              fillColor: Colors.white,
                              filled: true,
                              border:
                                  InputBorder.none, // Remove the default border
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
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontFamily:
                                    'ProtestRiot', // Apply ProtestRiot font to label
                                color: Color(0xFF076A89),
                              ),
                              // prefixIcon: Icon(Icons.lock),
                              fillColor: Colors.white,
                              filled: true,
                              border:
                                  InputBorder.none, // Remove the default border
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
                      const SizedBox(height: 25),
                      CustomButton(
                        text: 'SIGN IN',
                        onPressed: _handleLoginButtonPress,
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
                                    'Don\'t have an account?\n', // Add a newline character here
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
                                text: 'Sign Up',
                                style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 15.0,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to register page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()), // replace Register() with your register screen widget
                                    );
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

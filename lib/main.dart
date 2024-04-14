import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MentorShift(),
    ));

class MentorShift extends StatelessWidget {
  const MentorShift({super.key});

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
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
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
                            border: InputBorder.none, // Remove the default border
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
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
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
                            border: InputBorder.none, // Remove the default border
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
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B6E6D),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'ProtestRiot',
                          ),
                        ),
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
                                    // Navigate to sign-up page
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => SignUpPage()),
                                    // );
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

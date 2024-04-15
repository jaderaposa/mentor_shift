import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({super.key});

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
                  fit: BoxFit
                      .contain, // Scale the image to fit within the bounds
                ),
                const SizedBox(height: 20),
                const Text(
                  'Choose Role',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProtestRiot',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.grey,
                                //   width: 0,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF454545),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset(
                                  'images/Mentor.png',
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Mentor',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProtestRiot',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.grey,
                                //   width: 0,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF454545),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset(
                                  'images/Mentee.png',
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Mentee',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProtestRiot',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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

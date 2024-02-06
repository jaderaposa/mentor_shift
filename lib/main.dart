import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MentorShift(),
    ));

class MentorShift extends StatelessWidget {
  const MentorShift({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: const Text('Mentor Shift'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Set title color to white
          fontSize: 30.0, // Set title font size
          fontFamily: 'ProtestRiot',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Which One Are You?',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'ProtestRiot',
                color: Colors.green[800],
              ),
            ),
            // const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green[800],
                        disabledForegroundColor: Colors.grey,
                        padding: const EdgeInsets.all(30.0),
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'ProtestRiot',
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))), // Add this line
                      ),
                      child: const Text('Student'),
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Add space between buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green[800],
                        disabledForegroundColor: Colors.grey,
                        padding: const EdgeInsets.all(30.0),
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'ProtestRiot',
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))), // Add this line
                      ),
                      child: const Text('Mentor'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

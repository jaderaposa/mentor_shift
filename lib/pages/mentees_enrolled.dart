import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';

class MenteesEnrolled extends StatefulWidget {
  const MenteesEnrolled({super.key});

  @override
  State<MenteesEnrolled> createState() => _MenteesEnrolledState();
}

class _MenteesEnrolledState extends State<MenteesEnrolled> {
  List<Map<String, dynamic>> mentorships = [
    {'mentee': 'Mentee 1', 'image': 'images/icons/user_sample.png'},
    {'mentee': 'Mentee 2', 'image': 'images/icons/user_sample.png'},
    {'mentee': 'Mentee 3', 'image': 'images/icons/user_sample.png'},
    // Add more mentees as needed
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0B6E6D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B6E6D),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // replace with your custom back button
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Mentees Enrolled',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'ProtestRiot',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'images/icons/questionmark.png', // replace with the path to your custom icon
              width: 30.0, // adjust the width as needed
              height: 30.0, // adjust the height as needed
            ),
            onPressed: () {
              // Add your edit button functionality here
            },
          ),
        ],
      ),
      body: mentorships.isEmpty
          ? const Center(
              child: Text(
                'No mentees enrolled yet.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'ProtestRiot',
                  color: Colors.white,
                ),
              ),
            )
          : ListView.builder(
              itemCount: mentorships.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.005, // 1% of screen height
                    horizontal: screenSize.width * 0.05, // 5% of screen width
                  ),
                  padding: EdgeInsets.all(
                      screenSize.height * 0.01), // 1% of screen height
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF303030),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      boxShadow: const [kBoxShadow]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenSize.width * 0.1, // 10% of screen width
                        height: screenSize.width * 0.1, // 10% of screen width
                        decoration: const BoxDecoration(
                          color: Color(
                              0xFFEBAA00), // replace with your desired color
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              screenSize.width * 0.01), // 1% of screen width
                          child: ClipOval(
                            child: Image.asset(
                              mentorships[index]['image'], // dynamic image path
                              width:
                                  screenSize.width * 0.08, // 8% of screen width
                              height:
                                  screenSize.width * 0.08, // 8% of screen width
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        mentorships[index]['mentee'], // dynamic mentee name
                        style: TextStyle(
                          fontFamily: 'ProtestRiot',
                          color: Colors.white,
                          fontSize:
                              screenSize.width * 0.05, // 5% of screen width
                        ),
                      ),
                      // ... existing code ...
                    ],
                  ),
                );
              },
            ),
    );
  }
}

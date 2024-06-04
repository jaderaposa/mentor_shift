import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';

class MenteeRequests extends StatefulWidget {
  const MenteeRequests({super.key});

  @override
  State<MenteeRequests> createState() => _MenteeRequestsState();
}

class _MenteeRequestsState extends State<MenteeRequests> {
  List<Map<String, dynamic>> mentorshipRequests = [
    {'mentee': 'Mentee 1', 'image': 'images/icons/user_sample.png'},
    {'mentee': 'Mentee 2', 'image': 'images/icons/user_sample.png'},
    {'mentee': 'Mentee 3', 'image': 'images/icons/user_sample.png'},
    // Add more mentee requests as needed
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
            'Mentee Requests',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'ProtestRiot',
            ),
          ),
          centerTitle: true,
        ),
        body: mentorshipRequests.isEmpty
            ? const Center(
                child: Text(
                  'No mentee requests yet.',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'ProtestRiot',
                    color: Colors.white,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: mentorshipRequests.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.005,
                      horizontal: screenSize.width * 0.05,
                    ),
                    padding: EdgeInsets.all(screenSize.height * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF303030),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      boxShadow: const [kBoxShadow],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: screenSize.width * 0.1,
                          height: screenSize.width * 0.1,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEBAA00),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenSize.width * 0.01),
                            child: ClipOval(
                              child: Image.asset(
                                mentorshipRequests[index]['image'],
                                width: screenSize.width * 0.08,
                                height: screenSize.width * 0.08,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          mentorshipRequests[index]['mentee'],
                          style: TextStyle(
                            fontFamily: 'ProtestRiot',
                            color: Colors.white,
                            fontSize: screenSize.width * 0.05,
                          ),
                        ),
                        const Spacer(), // pushes the following widgets to the right
                        GestureDetector(
                          onTap: () {
                            // Add your code for accepting the request here
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                  8), // adjust the radius as needed
                            ),
                            child: IconButton(
                              icon:
                                  const Icon(Icons.check, color: Colors.white),
                              onPressed: () {
                                // This can be empty now, as the GestureDetector handles the tap
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add your code for declining the request here
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                  8), // adjust the radius as needed
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                // This can be empty now, as the GestureDetector handles the tap
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        bottomNavigationBar: CustomBottomNavigationBarMentor(
          currentIndex: 0, // set the currently selected item
          onTap: (index) {
            // handle the tap event
          },
        ));
  }
}

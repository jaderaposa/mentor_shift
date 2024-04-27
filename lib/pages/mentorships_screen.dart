import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';

class MentorshipsPage extends StatefulWidget {
  const MentorshipsPage({super.key});

  @override
  State<MentorshipsPage> createState() => _MentorshipsPageState();
}

class _MentorshipsPageState extends State<MentorshipsPage> {
  final List<String> mentorships = [
    'Mentorship 1',
    'Mentorship 2',
    'Mentorship 3',
    'Mentorship 4',
    'Mentorship 5',
    'Mentorship 6',
    'Mentorship 7',
    'Mentorship 8',
    'Mentorship 9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C9A91),
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
          'Mentee',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'ProtestRiot',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mentorships',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'ProtestRiot',
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'images/icons/search.png',
                    width: 35,
                    height: 35,
                  ),
                  onPressed: () {
                    // handle the button press
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mentorships.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff025d5c), Color(0xff00312e)],
                    ),
                  ),
                  child: Row(
                    children: [
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Subject Name', // replace with your subject name
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  color: Colors.white,
                                  fontSize: 35.0,
                                  // add other text styles as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 60.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Mentor Name', // replace with your mentor name
                                    style: TextStyle(
                                      fontFamily: 'ProtestRiot',
                                      // add other text styles as needed
                                    ),
                                  ),
                                  Image.asset(
                                    'images/icons/star.png', // replace with the path to your custom star icon
                                    height: 18, // adjust the size as needed
                                    width: 18, // adjust the size as needed
                                  ), // replace with your star rating widget
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.all(5), // adjust the padding as needed
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                        width: 100.0, // adjust the size as needed
                        height: 100.0, // adjust the size as needed
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'images/icons/user_sample.png', // replace with your image path
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // set the currently selected item
        onTap: (index) {
          // handle the tap event
        },
      ),
    );
  }
}

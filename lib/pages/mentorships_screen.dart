import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';

class MentorshipsPage extends StatefulWidget {
  const MentorshipsPage({super.key});

  @override
  State<MentorshipsPage> createState() => _MentorshipsPageState();
}

class _MentorshipsPageState extends State<MentorshipsPage> {
  final List<Map<String, dynamic>> mentorships = [
    {
      'subject': 'Subject 1',
      'mentor': 'Mentor 1',
      'rating': 5,
      'picture': 'images/icons/user_sample.png', // replace with your image path
    },
    {
      'subject': 'Subject 2',
      'mentor': 'Mentor 2',
      'rating': 4,
      'picture': 'images/icons/user_sample.png', // replace with your image path
    },
    {
      'subject': 'Subject 3',
      'mentor': 'Mentor 3',
      'rating': 3,
      'picture': 'images/icons/user_sample.png', // replace with your image path
    },
    //add more mentorships as needed
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
          'Mentorship',
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
                Text(
                  'My Mentorship(s)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width *
                        0.08, // 5% of screen width
                    fontFamily: 'ProtestRiot',
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'images/icons/search.png',
                    width: MediaQuery.of(context).size.width *
                        0.1, // 10% of screen width
                    height: MediaQuery.of(context).size.width *
                        0.1, // 10% of screen width
                  ),
                  onPressed: () {
                    // handle the button press
                  },
                  tooltip: 'Search Mentors',
                ),
              ],
            ),
          ),
          Expanded(
            child: mentorships.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'You have not enrolled into any mentorships/s yet',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white, // Add this line
                                fontFamily:
                                    'ProtestRiot', // Replace with your actual font family
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Click this icon at the top\n to look for one now.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white, // Add this line
                                    fontFamily:
                                        'ProtestRiot', // Replace with your actual font family
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(width: 10.0),
                                Image.asset(
                                  'images/icons/search.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: mentorships.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      mentorships[index]
                                          ['subject'], // dynamic subject name
                                      style: TextStyle(
                                        fontFamily: 'ProtestRiot',
                                        color: Colors.white,
                                        fontSize: (35.0 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            420, // Adjust the denominator to get the desired responsiveness
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20 * MediaQuery.of(context).size.height / 720),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            mentorships[index][
                                                'mentor'], // dynamic mentor name
                                            style: const TextStyle(
                                              fontFamily: 'ProtestRiot',
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(
                                            mentorships[index]['rating'],
                                            (index) => Image.asset(
                                              'images/icons/star.png', // replace with the path to your custom star icon
                                              height:
                                                  18, // adjust the size as needed
                                              width:
                                                  18, // adjust the size as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 224, 224, 224),
                              ),
                              width: 100.0,
                              height: 100.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      mentorships[index]
                                          ['picture'], // dynamic picture
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
    );
  }
}

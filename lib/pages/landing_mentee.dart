//import dart
import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';

class LandingMentee extends StatefulWidget {
  const LandingMentee({super.key});

  @override
  State<LandingMentee> createState() => _LandingMenteeState();
}

class Mentor {
  final String pictureUrl;
  final String name;
  final int stars;
  final int totalMentees;

  Mentor({
    required this.pictureUrl,
    required this.name,
    required this.stars,
    this.totalMentees = 0,
  });
}

class _LandingMenteeState extends State<LandingMentee> {
  List<Mentor> mentors = [
    Mentor(
      pictureUrl: 'images/icons/user_sample.png',
      name: 'Mentor 1',
      stars: 1,
      totalMentees: 69,
    ),
    Mentor(
      pictureUrl: 'images/icons/user_sample.png',
      name: 'Mentor 2',
      stars: 4,
      totalMentees: 420,
    ),
    Mentor(
      pictureUrl: 'images/icons/user_sample.png',
      name: 'Mentor 3',
      stars: 3,
      totalMentees: 666,
    ),
    Mentor(
      pictureUrl: 'images/icons/user_sample.png',
      name: 'Mentor 4',
      stars: 2,
      totalMentees: 2024,
    ),
    Mentor(
      pictureUrl: 'images/icons/user_sample.png',
      name: 'Mentor 5',
      stars: 5,
      totalMentees: 0,
    ),
    Mentor(
      pictureUrl: 'images/icons/user_sample.png',
      name: 'Mentor 6',
      stars: 4,
      totalMentees: 77,
    ),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search for Mentors',
                        hintStyle: TextStyle(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                      ),
                      style: const TextStyle(
                        fontFamily: 'ProtestRiot',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      // handle the button press
                    },
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Top Mentors',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'ProtestRiot',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'Top Rated',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'ProtestRiot',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3 -
                      5.0, // Subtract the height of the Padding widget
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mentors.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        // If this is the first item
                        return const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Add your desired padding
                        );
                      } else if (index == mentors.length + 1) {
                        // If this is the last item
                        return const Padding(
                          padding: EdgeInsets.only(
                              right: 20.0), // Add your desired padding
                        );
                      } else {
                        mentors.sort((a, b) => b.stars.compareTo(a.stars));
                        return SizedBox(
                          width: 180.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [kBoxShadow],
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff025d5c),
                                    Color(0xff00312e)
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 90.0,
                                        height: 90.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF936030),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(mentors[
                                                        index - 1]
                                                    .pictureUrl), // Subtract 1 from the index
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        mentors[index - 1]
                                            .name, // Subtract 1 from the index
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'ProtestRiot',
                                        ),
                                      ),
                                      const Text(
                                        'Expertise',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFFFF9061),
                                          fontFamily: 'ProtestRiot',
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          mentors[index - 1]
                                              .stars, // Subtract 1 from the index
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0, vertical: 2),
                                            child: Image.asset(
                                              'images/icons/star.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'Most Mentees',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'ProtestRiot',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3 -
                      5.0, // Subtract the height of the Padding widget
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mentors.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      mentors.sort(
                          (a, b) => b.totalMentees.compareTo(a.totalMentees));
                      if (index == 0) {
                        // If this is the first item
                        return const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Add your desired padding
                        );
                      } else if (index == mentors.length + 1) {
                        // If this is the last item
                        return const Padding(
                          padding: EdgeInsets.only(
                              right: 20.0), // Add your desired padding
                        );
                      } else {
                        return SizedBox(
                          width: 180.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [kBoxShadow],
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff025d5c),
                                    Color(0xff00312e)
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 90.0,
                                        height: 90.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF936030),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(mentors[
                                                        index - 1]
                                                    .pictureUrl), // Subtract 1 from the index
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        mentors[index - 1]
                                            .name, // Subtract 1 from the index
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'ProtestRiot',
                                        ),
                                      ),
                                      const Text(
                                        'Total Mentees',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFFFF9061),
                                          fontFamily: 'ProtestRiot',
                                        ),
                                      ),
                                      Text(
                                        mentors[index - 1]
                                            .totalMentees
                                            .toString(), // Subtract 1 from the index
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontFamily: 'ProtestRiot',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

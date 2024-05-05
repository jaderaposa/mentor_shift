import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';

class ViewMentor extends StatefulWidget {
  const ViewMentor({super.key});

  @override
  State<ViewMentor> createState() => _ViewMentorState();
}

class _ViewMentorState extends State<ViewMentor> {

  String bio = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'; // replace with your data

  int numberOfMentees = 24; // replace with your data
  List<String> expertise = [
    'Database',
    'Web Development',
    'Angular'
  ]; // replace with your data


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
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), // add this line
                  boxShadow: const [kBoxShadow],
                  gradient: const LinearGradient(
                    colors: [Color(0xff025d5c), Color(0xff00312e)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF936030),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              10.0), // adjust the padding as needed
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/icons/user_sample.png'), // replace with your image URL
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              10.0), // added SizedBox to separate the widgets
                      const Text(
                        'Mentor Name', // replace with your mentor's name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProtestRiot',
                        ),
                      ),
                      const Text(
                        'Expertise', // replace with your mentor's expertise
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFFF9061),
                          fontFamily: 'ProtestRiot',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5, // replace with your mentor's rating
                          (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Image.asset('images/icons/star.png',
                                height: 16, width: 16),
                          ), // replace with your custom icon path
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [kBoxShadow],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        // handle the button press
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xff00312e),
                            width:
                                2), // adjust the border color and width as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // adjust the border radius as needed
                        ),
                        backgroundColor: const Color(
                            0xff00312e), // adjust the background color as needed
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Request Mentorship',
                        style: TextStyle(
                          color:
                              Colors.white, // adjust the text color as needed
                          fontFamily:
                              'ProtestRiot', // replace with your custom font name
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [kBoxShadow],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        // handle the button press
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xff00312e),
                            width:
                                2), // adjust the border color and width as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // adjust the border radius as needed
                        ),
                        backgroundColor: const Color(
                            0xff00312e), // adjust the background color as needed
                        minimumSize: const Size(
                            double.infinity, 50), // adjust the height as needed
                      ),
                      child: const Text(
                        'Send A Message',
                        style: TextStyle(
                          color:
                              Colors.white, // adjust the text color as needed
                          fontFamily:
                              'ProtestRiot', // replace with your custom font name
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Stroked text
                        Text(
                          'Bio',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'ProtestRiot',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text
                        const Text(
                          'Bio',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'ProtestRiot',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Stack(
                      children: [
                        // Stroked text
                        Text(
                          bio,
                          style: TextStyle(
                            // fontSize: 16.0,
                            fontFamily: 'ProtestRiot',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text
                        Text(
                          bio,
                          style: const TextStyle(
                            // fontSize: 16.0,
                            fontFamily: 'ProtestRiot',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Stack(
                      children: [
                        Text(
                          'Field of Expertise',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'ProtestRiot',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.black,
                          ),
                        ),
                        const Text(
                          'Field of Expertise',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'ProtestRiot',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in expertise)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    // Stroked bullet
                                    Text(
                                      '•',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ProtestRiot',
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    // Solid bullet
                                    const Text(
                                      '•',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ProtestRiot',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10.0),
                                Stack(
                                  children: [
                                    // Stroked text
                                    Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ProtestRiot',
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    // Solid text
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ProtestRiot',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Stack(
                          children: [
                            // Stroked text
                            Text(
                              'Mentees: ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ProtestRiot',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.black,
                              ),
                            ),
                            // Solid text
                            const Text(
                              'Mentees: ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ProtestRiot',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Stack(
                          children: [
                            // Stroked text
                            Text(
                              '$numberOfMentees',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ProtestRiot',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                              ),
                            ),
                            // Solid text
                            Text(
                              '$numberOfMentees',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ProtestRiot',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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

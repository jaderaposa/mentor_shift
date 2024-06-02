import 'package:flutter/material.dart';
import 'package:mentor_shift/classes/achievement.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'dart:ui';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class CustomIcon {
  final String path;
  final String label;

  const CustomIcon({required this.path, required this.label});
}

class _UserProfileState extends State<UserProfile> {
  List<Achievement> achievements = [
    Achievement(
        name: 'Achievement 1',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: false),
    Achievement(
        name: 'Achievement 2',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: false),
    Achievement(
        name: 'Achievement 3',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: false),
    Achievement(
        name: 'Achievement 3',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: true),
    Achievement(
        name: 'Achievement 3',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: true),
    Achievement(
        name: 'Achievement 3',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: true),
    Achievement(
        name: 'Achievement 3',
        icon: Icons.star,
        color: const Color(0xffB74D00),
        isLocked: true),
    // Add more achievements as needed
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
          'User Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'ProtestRiot',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ), // replace with your custom edit button
            onPressed: () {
              // Add your edit button functionality here
            },
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              screenWidth * 0.03), // 2% of screen width
                          decoration: const BoxDecoration(
                            color: Color(0xFF035E5D),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(
                                screenWidth * 0.03), // 1% of screen width
                            decoration: BoxDecoration(
                              color: const Color(0xFF035E5D),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width:
                                    screenWidth * 0.005, // 0.5% of screen width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: screenWidth * 0.15, // 10% of screen width
                              backgroundColor: const Color(0xFF035E5D),
                              backgroundImage: const AssetImage(
                                'images/icons/user_sample.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ), // 1% of screen height
                        const Text(
                          'Sample Text',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'ProtestRiot',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          indicator: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          dividerColor: Colors.transparent,
                          tabs: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: const Tab(
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                      // fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'ProtestRiot'),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: const Tab(
                                child: Text(
                                  'Achievements',
                                  style: TextStyle(
                                      // fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'ProtestRiot'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF78BDB7),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: TabBarView(
                              physics:
                                  const NeverScrollableScrollPhysics(), // Add this line
                              children: [
                                const SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Full Name:',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontFamily: 'ProtestRiot',
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Jade Raposa',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: 'ProtestRiot',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.0,
                                  padding: const EdgeInsets.all(20.0),
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 4.0,
                                  children: achievements
                                      .map((Achievement achievement) {
                                    return GridTile(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: achievement.isLocked
                                                  ? Colors.grey
                                                  : achievement.color,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            child: Icon(achievement.icon,
                                                color: achievement.isLocked
                                                    ? Colors.black
                                                    : Colors.yellow),
                                          ),
                                          const SizedBox(height: 10),
                                          Flexible(
                                            child: Text(
                                              achievement.name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'ProtestRiot',
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black,
                                                  ),
                                                  Shadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // set the currently selected item
        onTap: (index) {
          // handle the tap event
        },
      ),
    );
  }
}

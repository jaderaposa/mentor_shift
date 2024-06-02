import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';

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
  List<CustomIcon> icons = [
    const CustomIcon(path: 'images/icons/hands.png', label: 'Active Mentee'),
    const CustomIcon(
        path: 'images/icons/dragonball.png', label: 'Mentee of the Month'),
    const CustomIcon(path: 'images/icons/hands.png', label: 'Dakilang Supot'),
    const CustomIcon(
        path: 'images/icons/dragonball.png', label: 'Best Depressed'),
    const CustomIcon(path: 'images/icons/hands.png', label: 'Fuck You'),
    const CustomIcon(
        path: 'images/icons/dragonball.png', label: 'Suck My Dick'),
    // Add more icons here...
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
                                      fontWeight: FontWeight.bold,
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
                                      fontWeight: FontWeight.bold,
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
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // 2% of screen width
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: GridView.builder(
                                            padding: EdgeInsets.all(
                                                screenWidth *
                                                    0.04), // 2% of screen width
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: screenWidth > 600
                                                  ? 4
                                                  : 3, // 4 columns for large screens, 3 for small screens
                                              mainAxisSpacing: screenWidth *
                                                  0.02, // 2% of screen width
                                              crossAxisSpacing: screenWidth *
                                                  0.02, // 2% of screen width
                                            ),
                                            itemCount: icons.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Image.asset(
                                                      icons[index].path),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      // Border
                                                      Text(
                                                        icons[index].label,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: screenWidth *
                                                              0.03, // 3% of screen width
                                                          foreground: Paint()
                                                            ..style =
                                                                PaintingStyle
                                                                    .stroke
                                                            ..strokeWidth = 2
                                                            ..color =
                                                                Colors.black,
                                                          fontFamily:
                                                              'ProtestRiot',
                                                        ),
                                                      ),
                                                      // Fill
                                                      Text(
                                                        icons[index].label,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: screenWidth *
                                                              0.03, // 3% of screen width
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'ProtestRiot',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
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

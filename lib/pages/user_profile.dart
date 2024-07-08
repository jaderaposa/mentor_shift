import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentor_shift/classes/achievement.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/services/auth_service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

// class User {
//   final String name;
//   final String profileImage;

//   User({required this.name, required this.profileImage});
// }

// final User currentUser = User(
//   name: 'Jade Raposa',
//   profileImage: 'images/icons/user_sample.png',
// );

class CustomIcon {
  final String path;
  final String label;

  const CustomIcon({required this.path, required this.label});
}

class _UserProfileState extends State<UserProfile> {
  final AuthService _authService = AuthService();
  UserDetails? userDetails;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    UserDetails? fetchedDetails = await _authService.getUserDetails();
    setState(() {
      userDetails = fetchedDetails;
    });
  }

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

    return FutureBuilder<String>(
        future: _authService.getUserRole(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the role to be fetched
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError || !snapshot.hasData) {
            // Handle error or no data scenario
            return const Scaffold(
              body: Center(child: Text('Error fetching role')),
            );
          } else {
            // Now we have the role, so we can determine the background color
            String userRole = snapshot.data!;
            Color backgroundColor = userRole == 'mentor'
                ? const Color(0xFF0B6E6D)
                : const Color(
                    0xFF4C9A91); // Example colors for mentor and mentee
            Color profileCircle = userRole == 'mentor'
                ? const Color(0xFF4C9A91)
                : const Color(
                    0xFF0B6E6D); // Example colors for mentor and mentee

            return Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: backgroundColor,
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
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.03),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      screenWidth * 0.02), // 2% of screen width
                                  decoration: BoxDecoration(
                                    color: profileCircle,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(screenWidth *
                                        0.02), // 1% of screen width
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: screenWidth *
                                            0.005, // 0.5% of screen width
                                      ),
                                    ),
                                    // Inside the UserProfile widget's build method, where the CircleAvatar is defined
                                    child: CircleAvatar(
                                      radius: screenWidth *
                                          0.15, // 10% of screen width
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: userDetails
                                                      ?.profileImage !=
                                                  null &&
                                              Uri.tryParse(userDetails!
                                                          .profileImage!)
                                                      ?.isAbsolute ==
                                                  true
                                          ? NetworkImage(
                                              userDetails!.profileImage!)
                                          : const AssetImage(
                                                  'images/icons/user_sample.png')
                                              as ImageProvider,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeight *
                                        0.01), // 1% of screen height
                                Text(
                                  userDetails?.mentorDisplayName ??
                                      'Default Name', // Dynamic mentor display name
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'ProtestRiot',
                                  ),
                                )
                                //add the current role of the user here
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
                                  indicator: const BoxDecoration(
                                    color: Color(0xFF00312E),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  dividerColor: Colors.transparent,
                                  tabs: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
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
                                        // Inside the TabBarView children of the 'About' tab
                                        SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0,
                                                vertical: 10.0),
                                            child: GridView.count(
                                              shrinkWrap:
                                                  true, // Add this to make GridView take minimum space
                                              physics:
                                                  const NeverScrollableScrollPhysics(), // Add this to disable GridView's own scrolling since it's inside a SingleChildScrollView
                                              crossAxisCount: 2,
                                              childAspectRatio:
                                                  3, // Adjust based on your content
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 1,
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              children: [
                                                const Text(
                                                  'Full Name:',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                Text(
                                                  '${userDetails?.firstName ?? ""} ${userDetails?.lastName ?? ""}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                const Text(
                                                  'Mentor Display Name:',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                Text(
                                                  userDetails
                                                          ?.mentorDisplayName ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                const Text(
                                                  'Date of Birth:',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                Text(
                                                  userDetails?.dateOfBirth !=
                                                          null
                                                      ? DateFormat(
                                                              'MMMM d, yyyy')
                                                          .format(userDetails!
                                                              .dateOfBirth!)
                                                      : '', // Displaying date in Month name day, year format
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                const Text(
                                                  'Educational Background:',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                Text(
                                                  userDetails
                                                          ?.educationalBackground ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                const Text(
                                                  'Fields of Expertise:',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'ProtestRiot'),
                                                ),
                                                // Assuming fieldsOfExpertise is a List<String>
                                                Text(
                                                  userDetails?.fieldsOfExpertise
                                                          .join(', ') ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'ProtestRiot'),
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      color: achievement
                                                              .isLocked
                                                          ? Colors.grey
                                                          : achievement.color,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                        achievement.icon,
                                                        color: achievement
                                                                .isLocked
                                                            ? Colors.black
                                                            : Colors.yellow),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Flexible(
                                                    child: Text(
                                                      achievement.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'ProtestRiot',
                                                        shadows: <Shadow>[
                                                          Shadow(
                                                            offset: Offset(
                                                                1.0, 1.0),
                                                            blurRadius: 3.0,
                                                            color: Colors.black,
                                                          ),
                                                          Shadow(
                                                            offset: Offset(
                                                                1.0, 1.0),
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
            );
          }
        });
  }
}

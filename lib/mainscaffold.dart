import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/pages/mentee_search.dart';
import 'package:mentor_shift/pages/mentorships_screen.dart';
import 'package:mentor_shift/pages/messaging.dart';
import 'package:mentor_shift/pages/user_profile.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  final _pages = [
    const MentorshipsPage(),
    const MenteeSearch(),
    const Messaging(),
    const UserProfile(),
    // Add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

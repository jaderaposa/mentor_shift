import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/pages/mentee_search.dart';
import 'package:mentor_shift/pages/mentorships_screen.dart';
import 'package:mentor_shift/pages/messaging.dart';
import 'package:mentor_shift/pages/user_profile.dart';
import 'package:mentor_shift/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key})
      : super(key: key); // Corrected super.key to key
  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  final AuthService _authService = AuthService();
  String role = '';
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
      bottomNavigationBar: role == 'mentor'
          ? CustomBottomNavigationBarMentor(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : CustomBottomNavigationBar(
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

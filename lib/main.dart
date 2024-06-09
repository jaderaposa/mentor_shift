import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/landing_mentee.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/mentee_requests.dart';
import 'package:mentor_shift/pages/mentees_enrolled.dart';
import 'package:mentor_shift/pages/mentor_content_page.dart';
import 'package:mentor_shift/pages/mentor_learning_page.dart';
import 'package:mentor_shift/pages/register.dart';
import 'package:mentor_shift/pages/register2_mentee.dart';
import 'package:mentor_shift/pages/register3_mentor.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/pages/register1.dart';
import 'package:mentor_shift/pages/mentee_search.dart';
import 'package:mentor_shift/pages/mentorships_screen.dart';
import 'package:mentor_shift/pages/messaging.dart';
import 'package:mentor_shift/pages/user_profile.dart';
import 'package:mentor_shift/pages/view_mentor.dart';
import 'package:mentor_shift/pages/view_messaging.dart';
import 'package:mentor_shift/mainscaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAUL3VJUldMs6zAW52WDo71KfwoPhrO3NI",
            authDomain: "mentor-shift.firebaseapp.com",
            projectId: "mentor-shift",
            storageBucket: "mentor-shift.appspot.com",
            messagingSenderId: "404217509031",
            appId: "1:404217509031:web:7dc0ce82a33d351b025782",
            measurementId: "G-M36LS7JGD4"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/main',
    routes: {
      '/main': (context) => const MainScaffold(),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/register1': (context) => const Register1(),
      '/role': (context) => const Role(),
      '/menteehome': (context) => const MenteeSearch(),
      '/mentorships': (context) => const MentorshipsPage(),
      '/message': (context) => const Messaging(),
      '/viewmessage': (context) => const ViewMessaging(),
      '/viewmentor': (context) => const ViewMentor(),
      '/register2': (context) => const Register2(),
      '/register3': (context) => const Register3(),
      '/landingmentee': (context) => const LandingMentee(),
      '/mlp': (context) => const MentorLearningPage(),
      '/userprofile': (context) => const UserProfile(),
      '/mcp': (context) => const MentorContentPage(),
      '/enrolled': (context) => const MenteesEnrolled(),
      '/requests': (context) => const MenteeRequests(),
    },
  ));
}

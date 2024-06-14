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
  // await Firebase.initializeApp();

  if (kIsWeb) {
    Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCL8TqeUIoQscauixfzQjBg4scYeBk9QdM',
            authDomain: 'mentor-shift-project.firebaseapp.com',
            projectId: 'mentor-shift-project',
            storageBucket: 'mentor-shift-project.appspot.com',
            messagingSenderId: '494407872849',
            appId: '1:494407872849:web:077c22e752343fd2d22370'));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyD9L_QYZGLEZTC1D799P4Y-rbkcpEYehTs',
      appId: '1:494407872849:android:ea0933d7d60c65c3d22370',
      messagingSenderId: '494407872849',
      projectId: 'mentor-shift-project',
      storageBucket: 'mentor-shift-project.appspot.com',
    ));
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/register3',
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

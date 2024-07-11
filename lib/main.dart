import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentor_shift/mainscaffold.dart';
import 'package:mentor_shift/pages/landing_mentee.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/mentee_requests.dart';
import 'package:mentor_shift/pages/mentor_search.dart';
import 'package:mentor_shift/pages/mentees_enrolled.dart';
import 'package:mentor_shift/pages/mentor_content_page.dart';
import 'package:mentor_shift/pages/mentor_learning_page.dart';
import 'package:mentor_shift/pages/mentorships_screen.dart';
import 'package:mentor_shift/pages/messaging.dart';
import 'package:mentor_shift/pages/register.dart';
import 'package:mentor_shift/pages/register1.dart';
import 'package:mentor_shift/pages/register2_mentee.dart';
import 'package:mentor_shift/pages/register3_mentor.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/pages/user_profile.dart';
import 'package:mentor_shift/pages/view_mentor.dart';
import 'package:mentor_shift/pages/view_messaging.dart';
import 'package:mentor_shift/services/route_names.dart';

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

  auth.FirebaseAuth.instance.authStateChanges().listen((auth.User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RouteNames.main,
    routes: {
      RouteNames.main: (context) => const MainScaffold(),
      RouteNames.login: (context) => const Login(),
      RouteNames.register: (context) => const Register(),
      RouteNames.register1: (context) => const Register1(),
      RouteNames.register2: (context) => const Register2(),
      RouteNames.register3: (context) => const Register3(),
      RouteNames.role: (context) => Role(),
      RouteNames.landingmentee: (context) => const LandingMentee(),
      RouteNames.mentorships: (context) => const MentorshipsPage(),
      RouteNames.message: (context) => const Messaging(),
      RouteNames.viewmessage: (context) => const ViewMessaging(),
      RouteNames.viewmentor: (context) => const ViewMentor(),
      RouteNames.menteesearch: (context) => const MentorSearch(),
      RouteNames.userprofile: (context) => const UserProfile(),
      RouteNames.mcp: (context) => const MentorContentPage(),
      RouteNames.mlp: (context) => const MentorLearningPage(),
      RouteNames.enrolled: (context) => const MenteesEnrolled(),
      RouteNames.requests: (context) => const MenteeRequests(),
    },
  ));
}

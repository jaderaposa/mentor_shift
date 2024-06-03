import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/landing_mentee.dart';
import 'package:mentor_shift/pages/login.dart';
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

void main() => runApp(MaterialApp(initialRoute: '/mcp', routes: {
      // '/': (context) => Loading(),
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
    }));

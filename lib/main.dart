import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/landing_mentee.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/mentor_learning_page.dart';
import 'package:mentor_shift/pages/register.dart';
import 'package:mentor_shift/pages/register2_mentee.dart';
import 'package:mentor_shift/pages/register3_mentor.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/pages/register1.dart';
import 'package:mentor_shift/pages/mentee_search.dart';
import 'package:mentor_shift/pages/mentorships_screen.dart';
import 'package:mentor_shift/pages/messaging.dart';
import 'package:mentor_shift/pages/view_mentor.dart';

void main() => runApp(MaterialApp(initialRoute: '/mlp', routes: {
      // '/': (context) => Loading(),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/register1': (context) => const Register1(),
      '/role': (context) => const Role(),
      '/menteehome': (context) => const MenteeSearch(),
      '/mentorships': (context) => const MentorshipsPage(),
      '/message': (context) => const Messaging(),
      '/viewmentor': (context) => const ViewMentor(),
      '/register2': (context) => const Register2(),
      '/register3': (context) => const Register3(),
      '/landingmentee': (context) => const LandingMentee(),
      '/mlp': (context) => const MentorLearningPage(),
    }));

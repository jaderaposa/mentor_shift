import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/register.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/pages/register1.dart';
import 'package:mentor_shift/pages/mentee_search.dart';
import 'package:mentor_shift/pages/mentorships_screen.dart';

void main() => runApp(MaterialApp(initialRoute: '/mentorships', routes: {
      // '/': (context) => Loading(),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/register1': (context) => const Register1(),
      '/role': (context) => const Role(),
      '/menteehome': (context) => const MenteeSearch(),
      '/mentorships': (context) => const MentorshipsPage(),
    }));

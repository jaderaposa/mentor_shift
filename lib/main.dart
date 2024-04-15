import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/register.dart';
import 'package:mentor_shift/pages/role.dart';

void main() => runApp(MaterialApp(initialRoute: '/role', routes: {
      // '/': (context) => Loading(),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/role': (context) => const Role(),
    }));

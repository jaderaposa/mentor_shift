import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/login.dart';

void main() => runApp(MaterialApp(initialRoute: '/login', routes: {
      // '/': (context) => Loading(),
      '/login': (context) => const Login(),
    }));

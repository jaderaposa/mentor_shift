import 'package:flutter/material.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/services/auth_service.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  _CheckLoginState createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    bool isLoggedIn = await _authService.isLoggedIn();
    if (isLoggedIn) {
      // If the user is logged in, navigate to the Role page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Role()),
      );
    } else {
      // If the user is not logged in, navigate to the Login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Show a loading indicator while checking login status
      ),
    );
  }
}

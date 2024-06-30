import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/loadingwidget.dart';
import 'package:mentor_shift/pages/landing_mentee.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/pages/mentor_content_page.dart';
import 'package:mentor_shift/pages/role.dart';
import 'package:mentor_shift/services/auth_service.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  final AuthService _authService = AuthService();
  String role = '';
  bool _isLoading = true;

  // final _pages = [
  //   const MentorshipsPage(),
  //   const MenteeSearch(),
  //   const Messaging(),
  //   const UserProfile(),
  //   const LandingMentee()
  //   // Add more pages as needed
  // ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeApp());
  }

  Future<void> _initializeApp() async {
    await _initializeUserRole();
    await _redirectUserIfNeeded();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _initializeUserRole() async {
    try {
      String fetchedRole = await _authService.getUserRole();
      if (mounted) {
        setState(() {
          role = fetchedRole;
        });
      }
    } catch (e) {
      debugPrint("Error fetching user role: $e");
    }
  }

  Future<void> _redirectUserIfNeeded() async {
    try {
      bool isLoggedIn = await _authService.isLoggedIn();
      if (!isLoggedIn) {
        if (mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Login()));
        }
      } else {
        String userRole = await _authService.getUserRole();

        if (userRole.isEmpty) {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Role()),
            );
          }
        } else {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            if (userRole == 'mentor') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MentorContentPage()),
              );
            } else if (userRole == 'mentee') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandingMentee()),
              );
            } else {
              // Handle any other roles or unexpected situations
              // For example, you can navigate to a default page or display an error message
              // ...
            }
          }
        }
      }
    } catch (e) {
      debugPrint("Error during redirection: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Convert the string role to UserRole enum
      UserRole? userRole;
      switch (role) {
        case 'mentor':
          userRole = UserRole.mentor;
          break;
        case 'mentee':
          userRole = UserRole.mentee;
          break;
        default:
          userRole = null; // Handle unknown or no role
          break;
      }

      // Only create LoadingWidget if userRole is not null
      if (userRole != null) {
        return LoadingWidget(role: userRole);
      } else {
        // Handle the case where there's no valid role
        // This could be a simple loading screen without specific role-based customization
        return const Center(child: CircularProgressIndicator());
      }
    } else {
      // Determine the page to display based on the user's role
      Widget pageToDisplay;
      switch (role) {
        case 'mentor':
          pageToDisplay = const MentorContentPage();
          break;
        case 'mentee':
          pageToDisplay = const LandingMentee();
          break;
        default:
          pageToDisplay =
              const Center(child: Text('Unknown role or no role assigned'));
          break;
      }

      return Scaffold(body: pageToDisplay);
    }
  }
}


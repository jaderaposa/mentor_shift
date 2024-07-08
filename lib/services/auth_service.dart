import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_shift/classes/user.dart';

class UserDetails {
  final String firstName;
  final String lastName;
  final String menteeDisplayName;
  final String mentorDisplayName;
  final DateTime? dateOfBirth;
  final String? yearLevel;
  final String? course;
  final String? educationalBackground;
  final List<String> fieldsOfExpertise;
  final String? profileImage; // Add this line

  UserDetails({
    required this.firstName,
    required this.lastName,
    this.menteeDisplayName = '',
    this.mentorDisplayName = '',
    this.dateOfBirth,
    this.yearLevel,
    this.course,
    this.educationalBackground,
    this.fieldsOfExpertise = const [],
    this.profileImage = '', // Add this line
  });

  factory UserDetails.fromDocument(DocumentSnapshot doc) {
    return UserDetails(
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      menteeDisplayName: doc['menteeDisplayName'],
      mentorDisplayName: doc['mentorDisplayName'],
      dateOfBirth: doc['dateOfBirth']?.toDate(),
      yearLevel: doc['yearLevel'],
      course: doc['course'],
      educationalBackground: doc['educationalBackground'],
      fieldsOfExpertise: List<String>.from(doc['fieldsOfExpertise']),
      profileImage: doc['profileImage'] ?? '',
    );
  }
}


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to register a user
  Future<String> registerUser(RegistrationData registrationData) async {
    try {
      // Create the user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: registrationData.email,
        password: registrationData.password,
      );

      // After the user is created, store additional details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'firstName': registrationData.firstName,
        'lastName': registrationData.lastName,
        'menteeDisplayName': registrationData.menteeDisplayName,
        'mentorDisplayName': registrationData.mentorDisplayName,
        'dateOfBirth': registrationData.dateOfBirth,
        'yearLevel': registrationData.yearLevel,
        'course': registrationData.course,
        'educationalBackground': registrationData.educationalBackground,
        'fieldsOfExpertise': registrationData.fieldsOfExpertise,
        'email': registrationData.email,
        'role': '', // Add this line
        'profileImage': registrationData.profileImage, // Add this line
      });

      return 'User registered successfully';
    } on FirebaseAuthException catch (e) {
      // Handle errors here
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email address is already in use by another account.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not valid.';
      } else {
        return 'Failed to register. Please try again later.';
      }
    } catch (e) {
      // Handle other exceptions
      return 'Failed to register. Please try again later.';
    }
  }

  // Function to login a user
  Future<void> loginUser(String email, String password) async {
    try {
      // Authenticate the user with email and password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Translate FirebaseAuthException codes to user-friendly messages
      if (e.code == 'wrong-password') {
        throw ('Incorrect password. Please try again.');
      } else if (e.code == 'user-not-found') {
        throw ('No account found for that email.');
      } else if (e.code == 'invalid-email') {
        throw ('Please enter a valid email address.');
      } else {
        throw ('Failed to login. Please try again later.');
      }
    } catch (e) {
      // Handle other exceptions
      throw ('An unexpected error occurred. Please try again later.');
    }
  }

  //Role Selection
  Future<void> updateUserRole(String role) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'role': role,
      });
    }
  }

  // Get the user's role
  Future<String> getUserRole() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return doc.get('role');
    }
    return '';
  }

  // Method to check if the user is logged in
  Future<bool> isLoggedIn() async {
    final User? user = _auth.currentUser;
    return user != null;
  }

  // Method to log out the user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserDetails?> getUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return UserDetails.fromDocument(doc);
    }
    return null;
  }
}

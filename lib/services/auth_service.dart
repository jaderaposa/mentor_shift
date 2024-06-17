import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_shift/classes/user.dart';

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
}

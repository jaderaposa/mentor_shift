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
      }
      // Add other error handling as needed
    }
    throw Exception('Registration failed');
  }
}

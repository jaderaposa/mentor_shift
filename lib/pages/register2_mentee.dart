//import dart
import 'package:flutter/material.dart';
import 'package:mentor_shift/classes/user.dart';
import 'package:mentor_shift/objects/backbutton.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/style/paddedcontainer.dart';
import 'package:mentor_shift/pages/register3_mentor.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => Register2State();
}

class Register2State extends State<Register2> {
  TextEditingController menteeDisplayNameController = TextEditingController();
  TextEditingController yearLevelController = TextEditingController();
  TextEditingController courseController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        onBackButtonPress: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0080B7), // Top color
                    Color(0xFF0B8274), // Bottom color
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/icons/mentorshiftorig.png',
                        width: double
                            .infinity, // Make the image take the full width
                        height:
                            120, // Keep the height fixed or adjust as needed
                        fit: BoxFit
                            .contain, // Scale the image to fit within the bounds
                      ),
                      const Text(
                        'Mentor-Shift',
                        style: TextStyle(
                          fontSize: 38,
                          fontFamily: 'ProtestRiot',
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(48, 50, 48, 0),
                        child: Column(
                          children: <Widget>[
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start, // Add this line
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Setting Up Role Profiles',
                                      style: TextStyle(
                                        fontSize:
                                            25, // Adjust the font size as needed
                                        color: Colors.white,
                                        fontFamily:
                                            'ProtestRiot', // Set the text color
                                      ),
                                    ),
                                    Text(
                                      'Mentee',
                                      style: TextStyle(
                                        fontSize:
                                            40, // Adjust the font size as needed
                                        color: Colors.white,
                                        fontFamily:
                                            'ProtestRiot', // Set the text color
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '3/4',
                                  style: TextStyle(
                                    fontSize:
                                        40, // Adjust the font size as needed
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                    color: Colors.white,
                                    fontFamily:
                                        'ProtestRiot', // Set the text color
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // First input box
                            PaddedContainer(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [kBoxShadow],
                                ),
                                child: TextFormField(
                                  controller: menteeDisplayNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Display Name', // Changed label
                                    labelStyle: TextStyle(
                                      fontFamily: 'ProtestRiot',
                                      color: Color(0xFF076A89),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                  ),
                                  keyboardType: TextInputType.name,
                                  style: const TextStyle(
                                    fontFamily: 'ProtestRiot',
                                  ),
                                ),
                              ),
                            ),
                            // Second input box
                            PaddedContainer(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [kBoxShadow],
                                ),
                                child: TextFormField(
                                  controller: yearLevelController,
                                  decoration: const InputDecoration(
                                    labelText: 'Year Level',
                                    labelStyle: TextStyle(
                                      fontFamily: 'ProtestRiot',
                                      color: Color(0xFF076A89),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                  ),
                                  keyboardType: TextInputType
                                      .number, // Assuming year level is numeric
                                  style: const TextStyle(
                                    fontFamily: 'ProtestRiot',
                                  ),
                                ),
                              ),
                            ),
                            // Third input box
                            PaddedContainer(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [kBoxShadow],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextFormField(
                                        controller: courseController,
                                        decoration: const InputDecoration(
                                          labelText: 'Course',
                                          labelStyle: TextStyle(
                                            fontFamily: 'ProtestRiot',
                                            color: Color(0xFF076A89),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'ProtestRiot',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // Update RegistrationData with the new information
                RegistrationData().setData(
                  menteeDisplayName: menteeDisplayNameController.text,
                  yearLevel: yearLevelController.text,
                  course: courseController.text,
                  // Add other fields as necessary
                );

                // Navigate to the next step in the registration process
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Register3()), // Replace NextStepPage with the actual next page in your registration process
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProtestRiot',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

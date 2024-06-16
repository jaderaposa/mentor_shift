import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mentor_shift/classes/user.dart';
import 'package:mentor_shift/objects/backbutton.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/style/paddedcontainer.dart';
import 'package:mentor_shift/pages/login.dart';
import 'package:mentor_shift/services/auth_service.dart';

class Register3 extends StatefulWidget {
  const Register3({super.key});

  @override
  State<Register3> createState() => Register3State();
}

class Register3State extends State<Register3> {
  List<String> selectedExpertises = [];
  TextEditingController fieldsOfExpertiseController = TextEditingController();
  TextEditingController mentorDisplayNameController = TextEditingController();
  TextEditingController educationalBackgroundController =
      TextEditingController();

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
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center, // Add this line
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Setting Up Role Profiles',
                                        style: TextStyle(
                                          fontSize:
                                              20, // Adjust the font size as needed
                                          color: Colors.white,
                                          fontFamily:
                                              'ProtestRiot', // Set the text color
                                        ),
                                      ),
                                      Text(
                                        'Mentor',
                                        style: TextStyle(
                                          fontSize:
                                              30, // Adjust the font size as needed
                                          color: Colors.white,
                                          fontFamily:
                                              'ProtestRiot', // Set the text color
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '4/4',
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
                                    controller: mentorDisplayNameController,
                                    decoration: const InputDecoration(
                                      labelText:
                                          'Display Name', // Changed label
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
                                    controller: educationalBackgroundController,
                                    decoration: const InputDecoration(
                                      labelText:
                                          'Educational Background', // Shortened label
                                      hintText:
                                          'Degree, Institution, Year Graduated', // Added hint text
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
                              // Third input box
                              PaddedContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [kBoxShadow],
                                      ),
                                      child: TextFormField(
                                        controller: fieldsOfExpertiseController,
                                        decoration: const InputDecoration(
                                          labelText: 'Field/s of Expertise',
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
                                        onFieldSubmitted: (String str) {
                                          setState(() {
                                            selectedExpertises.add(str);
                                            fieldsOfExpertiseController
                                                .clear(); // Clear the text field
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Wrap(
                                      alignment: WrapAlignment.start,
                                      spacing:
                                          4.0, // gap between adjacent chips
                                      runSpacing: 4.0, // gap between lines
                                      children: selectedExpertises
                                          .map((String expertise) {
                                        return ActionChip(
                                          label: Text(
                                            expertise,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'ProtestRiot',
                                              fontSize: 16,
                                            ),
                                          ),
                                          backgroundColor: Colors.blue,
                                          onPressed: () {
                                            setState(() {
                                              selectedExpertises
                                                  .remove(expertise);
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
              onPressed: () async {
                // Use the singleton instance to access the data
                RegistrationData registrationData = RegistrationData();

                // Set the new data
                registrationData.mentorDisplayName =
                    mentorDisplayNameController.text;
                registrationData.educationalBackground =
                    educationalBackgroundController.text;
                registrationData.fieldsOfExpertise = selectedExpertises;

                String registrationStatus =
                    await AuthService().registerUser(registrationData);

                if (mounted) {
                  // Check if the widget is still in the tree
                  if (registrationStatus == 'User registered successfully') {
                    // Navigate to Login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(registrationStatus)),
                    );
                  }
                }
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Change this to the color you want
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                'FINISH',
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

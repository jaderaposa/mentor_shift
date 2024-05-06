import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/backbutton.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/style/paddedcontainer.dart';

class Register3 extends StatefulWidget {
  const Register3({super.key});

  @override
  State<Register3> createState() => Register3State();
}

class Register3State extends State<Register3> {
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
                                      'Mentor',
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [kBoxShadow],
                                ),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Field/s of Expertise',
                                        hintStyle: TextStyle(
                                          fontFamily: 'ProtestRiot',
                                          color: Color(0xFF076A89),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 5, 15, 5),
                                      ),
                                      style: TextStyle(
                                        // Add this line
                                        fontFamily: 'ProtestRiot',
                                        color: Color(0xFF076A89),
                                      ),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: DropdownButton<String>(
                                          iconSize: 24,
                                          items: <String>[
                                            'Option 1',
                                            'Option 2',
                                            'Option 3'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                  // Add this line
                                                  fontFamily: 'ProtestRiot',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            // Handle change
                                          },
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
                // Navigate to the next sequence of the registration
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Register1()),
                // );
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
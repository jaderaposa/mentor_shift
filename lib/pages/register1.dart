import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/backbutton.dart';

class Register1 extends StatefulWidget {
  const Register1({Key? key}) : super(key: key);

  @override
  Register1State createState() => Register1State();
}

class Register1State extends State<Register1> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                        'images/mentorshiftorig.png',
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
                        padding: const EdgeInsets.fromLTRB(48, 20, 48, 0),
                        child: Column(
                          children: <Widget>[
                            const Row(
                              children: [
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize:
                                        20, // Adjust the font size as needed
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
                            // First Name input
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [kBoxShadow],
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                    fontFamily:
                                        'ProtestRiot', // Apply ProtestRiot font to label
                                    color: Color(0xFF076A89),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder
                                      .none, // Remove the default border
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                ),
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                  fontFamily:
                                      'ProtestRiot', // Apply ProtestRiot font to input text
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Last Name input
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [kBoxShadow],
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                    fontFamily:
                                        'ProtestRiot', // Apply ProtestRiot font to label
                                    color: Color(0xFF076A89),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder
                                      .none, // Remove the default border
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                ),
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                  fontFamily:
                                      'ProtestRiot', // Apply ProtestRiot font to input text
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Date of Birth input
                            Container(
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
                                      decoration: const InputDecoration(
                                        labelText: 'Date of Birth',
                                        labelStyle: TextStyle(
                                          fontFamily:
                                              'ProtestRiot', // Apply ProtestRiot font to label
                                          color: Color(0xFF076A89),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder
                                            .none, // Remove the default border
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 15.0),
                                      ),
                                      controller: TextEditingController(
                                          text: "${selectedDate.toLocal()}"
                                              .split(' ')[0]),
                                      enabled: false,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () => _selectDate(context),
                                  ),
                                ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register1()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Change this to the color you want
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

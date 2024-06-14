import 'package:flutter/material.dart';
import 'package:mentor_shift/classes/user.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/objects/backbutton.dart';
import 'package:mentor_shift/objects/style/paddedcontainer.dart';
import 'package:mentor_shift/pages/register2_mentee.dart';

class Register1 extends StatefulWidget {
  const Register1({Key? key}) : super(key: key);

  @override
  Register1State createState() => Register1State();
}

class Register1State extends State<Register1> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
// For date of birth, you might use a DateTime variable instead of a TextEditingController
  DateTime selectedDate = DateTime
      .now(); // Assuming you have a method to update this based on user selection

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
                                Text(
                                  'Let\'s get personal',
                                  style: TextStyle(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                    color: Colors.white,
                                    fontFamily:
                                        'ProtestRiot', // Set the text color
                                  ),
                                ),
                                Text(
                                  '2/4',
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
                            // First Name input
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
                                  controller: firstNameController,
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
                            ),
                            // const SizedBox(height: 20),
                            // Last Name input
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
                                  controller: lastNameController,
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
                            ),
                            // const SizedBox(height: 20),
                            // Date of Birth input
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
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: IconButton(
                                        icon: const Icon(Icons.calendar_today),
                                        onPressed: () => _selectDate(context),
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
                // Update RegistrationData with the new information collected in this step
                RegistrationData().setData(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  dateOfBirth:
                      selectedDate, // Assuming selectedDate is updated elsewhere in your code based on user input
                );
                // Navigate to the next registration step
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Register2()), // Assuming Register2 is the next step
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

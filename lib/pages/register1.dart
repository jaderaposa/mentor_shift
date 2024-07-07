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
      body: Stack(
        children: <Widget>[
          Container(
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
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.contain,
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
                      child: Column(
                        children: <Widget>[
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Let\'s get personal',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'ProtestRiot',
                                ),
                              ),
                              Text(
                                '2/4',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'ProtestRiot',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
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
                                          fontFamily: 'ProtestRiot',
                                          color: Color(0xFF076A89),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 15.0),
                                      ),
                                      controller: TextEditingController(
                                          text: "${selectedDate.toLocal()}"
                                              .split(' ')[0]),
                                      enabled: false,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'ProtestRiot'),
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
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            RegistrationData().setData(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              dateOfBirth: selectedDate,
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Register2()),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
    );
  }
}

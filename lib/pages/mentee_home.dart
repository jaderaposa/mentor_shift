import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/style/paddedcontainer.dart';

class MenteeHome extends StatefulWidget {
  const MenteeHome({super.key});

  @override
  State<MenteeHome> createState() => MenteeHomeState();
}

class MenteeHomeState extends State<MenteeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C9A91),
        title: const Text(
          'Mentee',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'ProtestRiot',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    fontFamily: 'ProtestRiot',
                    color: Color(0xFF076A89),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                ),
                style: const TextStyle(
                  fontFamily: 'ProtestRiot',
                ),
              ),
            ),
          ),
          // Add more widgets to the column here
        ],
      ),
    );
  }
}

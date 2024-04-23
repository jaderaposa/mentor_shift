import 'package:flutter/material.dart';

class MentorshipsPage extends StatefulWidget {
  const MentorshipsPage({super.key});

  @override
  State<MentorshipsPage> createState() => _MentorshipsPageState();
}

class _MentorshipsPageState extends State<MentorshipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C9A91),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // replace with your custom back button
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
            padding:
                const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mentorships',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'ProtestRiot',
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'images/icons/search.png',
                    width: 35,
                    height: 35,
                    ),
                  onPressed: () {
                    // handle the button press
                  },
                ),
              ],
            ),            
          ),
          Container(
            // add your mentorship list here that are looped

          )
          // rest of your code...
        ],
      ),
    );
  }
}

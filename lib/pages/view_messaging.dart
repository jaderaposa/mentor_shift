import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:intl/intl.dart';

class ViewMessaging extends StatefulWidget {
  const ViewMessaging({Key? key}) : super(key: key);

  @override
  ViewMessagingState createState() => ViewMessagingState();
}

class ViewMessagingState extends State<ViewMessaging> {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Me',
      'message': 'Hello MotherFather!',
      'time': '10:00 AM',
    },
    {
      'sender': 'Person 1',
      'message': 'Hi, how are you?',
      'time': '10:05 AM',
    },
    {
      'sender': 'Me',
      'message': 'I\'m not okay and I have depression. :)',
      'time': '10:10 AM',
    },
    {
      'sender': 'Me',
      'message': 'HELL YEAH BOI',
      'time': '10:20 AM',
    },
    {
      'sender': 'Person 1',
      'message': 'THAT\'S AWESOME! great to hear that! keep it up.',
      'time': '10:15 AM',
    },

    // add more messages as needed
  ];

  @override
  void initState() {
    super.initState();
    messages.sort((a, b) {
      DateFormat format = DateFormat.jm(); // for AM/PM format
      DateTime timeA = format.parse(a['time']);
      DateTime timeB = format.parse(b['time']);
      return timeA.compareTo(timeB);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B6E6D),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ), // replace with your custom back button
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(), // This will take up all available space
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: screenHeight *
                      0.02, // replace 0.05 with the desired fraction of the screen height
                  backgroundImage:
                      const AssetImage('images/icons/user_sample.png'),
                ),
                const SizedBox(width: 10),
                Text(
                  'Glaiza Mea Millete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.028,
                    fontFamily: 'ProtestRiot',
                  ),
                ),
              ],
            ),
            const Spacer(
                flex:
                    2), // This will take up twice the space of the other Spacer
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                    child:
                        Container()), // This will take up all available space
                ListView.builder(
                  shrinkWrap:
                      true, // This makes the ListView.builder wrap its content
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool isMe = messages[index]['sender'] == 'Me';
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width *
                                  0.7, // 70% of screen width
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0B6E6D),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messages[index]['message'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.02,
                                      fontFamily: 'ProtestRiot',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(
                              messages[index]['time'],
                              style: TextStyle(
                                color: const Color.fromARGB(205, 88, 88, 88),
                                fontSize: screenHeight * 0.015,
                                fontFamily: 'ProtestRiot',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type A Message',
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Image(
                    image: AssetImage(
                        'images/icons/send.png'), // replace 'assets/images/send.png' with the path to your custom icon
                    width: 39, // adjust the width as needed
                    height: 39, // adjust the height as needed
                  ),
                  onPressed: () {
                    // Temporary sample code
                    print('Send button pressed');
                  },
                ),
              ),
              style: const TextStyle(
                fontFamily: 'ProtestRiot',
              ),
            ),
          )
        ],
      ),
    );
  }
}

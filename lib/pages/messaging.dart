//dart basic structure import
import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/services/auth_service.dart';

class Messaging extends StatefulWidget {
  const Messaging({super.key});

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  final List<Map<String, dynamic>> messages = [
    {
      'name': 'Person 1',
      'time': '10:00 AM',
      'message': 'This is a short message.',
    },
    {
      'name': 'Person 2',
      'time': '9:30 AM',
      'message': 'This is a slightly longer message that might get cut off.',
    },
    {
      'name': 'Person 3',
      'time': '9:00 AM',
      'message':
          'This is a really long message that will definitely get cut off because it just keeps going and going and going...',
    },
    // add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<String>(
        future: _authService.getUserRole(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the role to be fetched
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError || !snapshot.hasData) {
            // Handle error or no data scenario
            return const Scaffold(
              body: Center(child: Text('Error fetching role')),
            );
          } else {
            // Now we have the role, so we can determine the background color
            String userRole = snapshot.data!;
            Color backgroundColor = userRole == 'mentor'
                ?  const Color(0xFF0B6E6D)
                : Colors.green; // Example colors

            return Scaffold(
              backgroundColor:
                  backgroundColor, // Use the fetched background color
              appBar: AppBar(
                backgroundColor: backgroundColor,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ), // replace with your custom back button
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.035,
                    fontFamily: 'ProtestRiot',
                  ),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Messaging',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: screenHeight * 0.04,
                  //           fontFamily: 'ProtestRiot',
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: 'Search',
                  //       labelStyle: TextStyle(
                  //         fontFamily: 'ProtestRiot',
                  //       ),
                  //       prefixIcon: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Icon(Icons.search),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //         borderSide: BorderSide(color: Colors.white),
                  //       ),
                  //     ),
                  //     style: TextStyle(
                  //       fontFamily: 'ProtestRiot',
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Container(
                            width: 60.0, // adjust the size as needed
                            height: 60.0, // adjust the size as needed
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipOval(
                                child: Image.asset(
                                  'images/icons/user_sample.png', // replace with your image URL
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    messages[index]['name'],
                                    style: const TextStyle(
                                      fontFamily: 'ProtestRiot',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    messages[index]['time'],
                                    style: const TextStyle(
                                      fontFamily: 'ProtestRiot',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                messages[index]['message'],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(255, 226, 226, 226),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}

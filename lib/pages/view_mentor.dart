import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'package:mentor_shift/pages/view_messaging.dart';
import 'package:mentor_shift/services/auth_service.dart';
import 'package:mentor_shift/services/messaging_service.dart';
import 'package:outlined_text/outlined_text.dart';

class ViewMentor extends StatefulWidget {
  final UserDetails mentor;

  const ViewMentor({Key? key, required this.mentor}) : super(key: key);

  @override
  State<ViewMentor> createState() => _ViewMentorState();
}

class _ViewMentorState extends State<ViewMentor> {
  final AuthService _authService = AuthService();
  final MessagingService _messagingService = MessagingService();

  String bio =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'; // replace with your data
  int numberOfMentees = 24; // replace with your data
  List<String> expertise = [
    'Database',
    'Web Development',
    'Angular'
  ]; // replace with your data

  Future<void> _navigateAndSendMessage(BuildContext context) async {
    String conversationId = await _getOrCreateConversationId();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ViewMessaging(
              conversationId: conversationId,
              receiverId: widget.mentor.userId,
            )));
  }

  Future<String> _getOrCreateConversationId() async {
    // Assuming you have access to the current user's ID and the mentor's ID
    UserDetails? currentUserDetails = await _authService.getUserDetails();
    String currentUserId =
        currentUserDetails?.userId ?? ""; // Fallback to an empty string if null
    String mentorId = widget.mentor
        .userId; // Replace with actual mentor's userId from your widget or state
    print("Mentor ID: $mentorId"); // Print statement to verify mentorId
    // Use the MessagingService to generate a consistent conversation ID
    return _messagingService.generateConversationId(currentUserId, mentorId);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.22), // 10% of screen width
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), // add this line
                  boxShadow: const [kBoxShadow],
                  gradient: const LinearGradient(
                    colors: [Color(0xff025d5c), Color(0xff00312e)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02), // 2% of screen height
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenWidth * 0.35, // 30% of screen width
                        height: screenHeight * 0.2, // 15% of screen height
                        decoration: BoxDecoration(
                          // color: const Color(0xFF936030),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF936030), // Border color
                            width: 3, // Border width
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.mentor.profileImage != null &&
                                          widget.mentor.profileImage!
                                              .isNotEmpty &&
                                          Uri.tryParse(widget
                                                      .mentor.profileImage!)
                                                  ?.hasAbsolutePath ==
                                              true
                                      ? widget.mentor.profileImage!
                                      : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png', // Default image path
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: screenHeight * 0.01), // 1% of screen height
                      // added SizedBox to separate the widgets
                      Text(
                        widget.mentor
                            .mentorDisplayName, // Display the mentor's name
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProtestRiot',
                        ),
                      ),
                      const Text(
                        'Expertise', // replace with your mentor's expertise
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFFF9061),
                          fontFamily: 'ProtestRiot',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5, // replace with your mentor's rating
                          (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Image.asset('images/icons/star.png',
                                height: 16, width: 16),
                          ), // replace with your custom icon path
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1, vertical: screenHeight * 0.01),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [kBoxShadow],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        // handle the button press
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xff00312e),
                            width:
                                2), // adjust the border color and width as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // adjust the border radius as needed
                        ),
                        backgroundColor: const Color(
                            0xff00312e), // adjust the background color as needed
                        minimumSize: Size(double.infinity,
                            screenHeight * 0.06), // 6% of screen height
                      ),
                      child: Text(
                        'Request Mentorship',
                        style: TextStyle(
                          color:
                              Colors.white, // adjust the text color as needed
                          fontFamily:
                              'ProtestRiot', // replace with your custom font name
                          fontSize: screenWidth * 0.03, // 3.5% of screen width
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.01), // 1% of screen width
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [kBoxShadow],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        _navigateAndSendMessage(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xff00312e),
                            width:
                                2), // adjust the border color and width as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // adjust the border radius as needed
                        ),
                        backgroundColor: const Color(
                            0xff00312e), // adjust the background color as needed
                        minimumSize: Size(double.infinity,
                            screenHeight * 0.06), // 6% of screen height
                        // adjust the height as needed
                      ),
                      child: Text(
                        'Send A Message',
                        style: TextStyle(
                          color:
                              Colors.white, // adjust the text color as needed
                          fontFamily:
                              'ProtestRiot', // replace with your custom font name
                          fontSize: screenWidth * 0.035, // 3.5% of screen width
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedText(
                      text: const Text(
                        'Bio',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'ProtestRiot',
                          color: Colors.white,
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(color: Colors.black, width: 3),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    OutlinedText(
                      text: Text(
                        widget.mentor.bio?.isNotEmpty ?? false
                            ? widget.mentor.bio!
                            : 'No bio available',
                        style: const TextStyle(
                          // fontSize: 20.0,
                          fontFamily: 'ProtestRiot',
                          color: Colors.white,
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(color: Colors.black, width: 2),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    OutlinedText(
                      text: const Text(
                        'Field of Expertise',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'ProtestRiot',
                          color: Colors.white,
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(color: Colors.black, width: 3),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.mentor.fieldsOfExpertise
                          .map((item) => Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10.0),
                                child: OutlinedText(
                                  text: Text(
                                    "• $item", // Prepend a bullet before the item
                                    style: const TextStyle(
                                      fontFamily: 'ProtestRiot',
                                      color: Colors.white,
                                    ),
                                  ),
                                  strokes: [
                                    OutlinedTextStroke(
                                        color: Colors.black, width: 2),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        OutlinedText(
                          text: const Text(
                            'Mentees: ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'ProtestRiot',
                              color: Colors.white,
                            ),
                          ),
                          strokes: [
                            OutlinedTextStroke(color: Colors.black, width: 3),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Stack(
                          children: [
                            // Stroked text
                            Text(
                              '$numberOfMentees',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ProtestRiot',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                              ),
                            ),
                            // Solid text
                            Text(
                              '$numberOfMentees',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'ProtestRiot',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

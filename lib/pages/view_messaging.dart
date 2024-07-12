import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:intl/intl.dart';
import 'package:mentor_shift/classes/message_model.dart';
import 'package:mentor_shift/services/auth_service.dart';
import 'package:timezone/timezone.dart' as tz;

class ViewMessaging extends StatefulWidget {
  final String conversationId;
  final String receiverId;

  const ViewMessaging(
      {Key? key,
      required this.conversationId,
      required this.receiverId})
      : super(key: key);

  @override
  ViewMessagingState createState() => ViewMessagingState();
}

class ViewMessagingState extends State<ViewMessaging> {
  final TextEditingController _messageController = TextEditingController();
  final AuthService _authService = AuthService();
  late String _conversationId;
  UserDetails? _receiverDetails;
  late Stream<List<Message>> _messagesStream;

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
    _conversationId = widget.conversationId;
    _messagesStream = _authService.getMessages(_conversationId);
    _fetchReceiverDetails();
    messages.sort((a, b) {
      DateFormat format = DateFormat.jm(); // for AM/PM format
      DateTime timeA = tz.TZDateTime.from(
          format.parse(a['time']), tz.getLocation('Asia/Manila'));
      DateTime timeB = tz.TZDateTime.from(
          format.parse(b['time']), tz.getLocation('Asia/Manila'));
      return timeA.compareTo(timeB);
    });
  }

  Future<void> _fetchReceiverDetails() async {
    UserDetails? details =
        await _authService.getUserDetailsById(widget.receiverId);
    if (details != null) {
      setState(() {
        _receiverDetails = details;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B6E6D),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          children: [
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: screenHeight * 0.025,
                  backgroundImage: NetworkImage(
                    _receiverDetails?.profileImage != null &&
                            _receiverDetails!.profileImage!.isNotEmpty &&
                            Uri.tryParse(_receiverDetails!.profileImage!)
                                    ?.hasAbsolutePath ==
                                true
                        ? _receiverDetails!.profileImage!
                        : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png', // Default image path
                  ) as ImageProvider,
                ),
                const SizedBox(width: 15),
                Text(
                  _receiverDetails?.mentorDisplayName ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.028,
                    fontFamily: 'ProtestRiot',
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<Message> messages = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    bool isMe = messages[index].senderId ==
                        _authService.currentUser?.uid;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
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
                                    messages[index].text,
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
                              DateFormat('hh:mm a')
                                  .format(messages[index].timestamp),
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
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: TextField(
              controller: _messageController,
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
                    image: AssetImage('images/icons/send.png'),
                    width: 39,
                    height: 39,
                  ),
                  onPressed: () async {
                    if (_messageController.text.isNotEmpty) {
                      Message message = Message(
                        senderId:
                            _authService.currentUser!.uid,
                        receiverId:
                            widget.receiverId, // Assuming mentorId is available here
                        text: _messageController.text,
                        timestamp: DateTime.now(),
                      );
                      await _authService.sendMessage(
                          widget.conversationId, message);
                      _messageController.clear();
                    }
                  },
                ),
              ),
              style: const TextStyle(
                fontFamily: 'ProtestRiot',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

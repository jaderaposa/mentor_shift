class Message {
  String senderId;
  String receiverId;
  String text;
  DateTime timestamp;

  Message(
      {required this.senderId,
      required this.receiverId,
      required this.text,
      required this.timestamp});

  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'receiverId': receiverId,
        'text': text,
        'timestamp': timestamp,
      };

  static Message fromJson(Map<String, dynamic> json) => Message(
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        text: json['text'],
        timestamp: json['timestamp'].toDate(),
      );
}

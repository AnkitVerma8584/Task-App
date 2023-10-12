class Message {
  final String text, time;
  final String sender, receiver;
  final bool isSeen;

  Message(
      {required this.text,
      required this.time,
      required this.sender,
      required this.receiver,
      required this.isSeen});
}

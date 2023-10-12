import 'package:task_app/models/chat/message.dart';

class UserChat {
  final String name, image;
  final List<Message> messages;
  late String lastMessage, time;
  late String unseenMessage;

  UserChat({required this.name, required this.image, required this.messages}) {
    if (messages.isEmpty) {
      unseenMessage = "";
      lastMessage = "";
      time = "";
      return;
    }
    lastMessage = messages.last.text;
    time = messages.last.time;
    var unseen = messages.where((element) => element.isSeen == false);
    unseenMessage = unseen.length.toString();
  }
}

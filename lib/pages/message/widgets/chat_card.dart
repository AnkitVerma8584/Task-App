import 'package:flutter/material.dart';
import 'package:task_app/models/chat/user_chats.dart';
import 'package:task_app/pages/message/chat/chat_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.userChat});
  final UserChat userChat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ChatScreen(userChat: userChat))),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  userChat.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userChat.name),
                  Text(userChat.lastMessage),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [Text(userChat.time), Text(userChat.unseenMessage)],
            ),
          ],
        ),
      )),
    );
  }
}

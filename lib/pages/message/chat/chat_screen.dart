import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/chat/message.dart';
import 'package:task_app/models/chat/user_chats.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.userChat});

  final UserChat userChat;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    userChat.image,
                    height: 30,
                    width: 30,
                  ),
                )
              ],
            ),
          ),
          title: Text(
            userChat.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.2)),
                  child: const Icon(CupertinoIcons.search),
                )),
            const SizedBox(width: 10)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MessagesSection(messages: userChat.messages),
              const WriteMessageSection()
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesSection extends StatelessWidget {
  const MessagesSection({super.key, required this.messages});
  final List<Message> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(messages[index].text),
              );
            }));
  }
}

class WriteMessageSection extends StatefulWidget {
  const WriteMessageSection({super.key});

  @override
  State<WriteMessageSection> createState() => _WriteMessageSectionState();
}

class _WriteMessageSectionState extends State<WriteMessageSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () => _controller.clear(),
                  icon: const Icon(Icons.clear)),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.send))
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/dummy/chat_list.dart';
import 'package:task_app/pages/message/widgets/chat_card.dart';
import 'package:task_app/pages/message/widgets/message_tab.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<String> tabs = const ["All", "Mobile", "Web App", "Archive"];
  var selectedIndex = 0;

  void changeIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: myAppBar(),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: tabs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => changeIndex(index),
                          child: MessageTab(
                              tabName: tabs[index],
                              isSelected: index == selectedIndex),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: Consumer<ChatList>(
                    builder: (context, value, child) {
                      return ListView.builder(
                          itemCount: value.userChats.length,
                          itemBuilder: (context, index) =>
                              ChatCard(userChat: value.userChats[index]));
                    },
                  ))
                ],
              ),
            )));
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Message",
        style: TextStyle(fontWeight: FontWeight.bold),
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
        const SizedBox(width: 10),
        InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(0.2)),
              child: const Icon(Icons.edit_square),
            )),
        const SizedBox(width: 10)
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/theme/colors.dart';

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
            appBar: AppBar(
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
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
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
                  Expanded(
                      child: ListView(
                    children: const [ChatCard(), ChatCard()],
                  ))
                ],
              ),
            )));
  }
}

class MessageTab extends StatelessWidget {
  const MessageTab(
      {super.key, required this.tabName, required this.isSelected});
  final String tabName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  isSelected ? getColorsScheme(context).primary : Colors.grey,
              width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        tabName,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? getColorsScheme(context).primary : Colors.grey),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset("assets/users/p1.png")),
        title: const Text("Leslie Alenxander"),
        subtitle: const Text("Lets meet"),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text("9:45 pm"), Text("6")],
        ),
      ),
    );
  }
}

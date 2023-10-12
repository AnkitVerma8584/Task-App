import 'package:flutter/material.dart';
import 'package:task_app/models/chat/message.dart';
import 'package:task_app/models/chat/user_chats.dart';

class ChatList extends ChangeNotifier {
  List<UserChat> userChats = [
    UserChat(
        name: "Leslie Alenxander",
        image: "assets/users/p1.png",
        messages: first),
    UserChat(
        name: "Peter Parker", image: "assets/users/p3.png", messages: second),
    UserChat(name: "Adam Sandler", image: "assets/users/p4.png", messages: []),
    UserChat(name: "Ruskin bond", image: "assets/users/p2.png", messages: [])
  ];
}

List<Message> first = [
  Message(
      text: "Hi",
      time: "9:45 am",
      sender: "Peter Parker",
      receiver: "Leslie Alenxander",
      isSeen: false),
  Message(
      text: "How are you",
      time: "9:50 am",
      sender: "Peter Parker",
      receiver: "Leslie Alenxander",
      isSeen: false),
];

List<Message> second = [
  Message(
      text: "Yooo",
      time: "9:40 am",
      sender: "Peter Parker",
      receiver: "Leslie Alenxander",
      isSeen: true),
  Message(
      text: "How are you buddy",
      time: "10:10 am",
      sender: "Peter Parker",
      receiver: "Leslie Alenxander",
      isSeen: false),
];

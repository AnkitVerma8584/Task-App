import 'package:flutter/material.dart';

import '../../common/components/sized_boxes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/users/p1.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sh8,
              const Text(
                "Rubin Malhotra",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                "UI/UX Designer",
                style: TextStyle(color: Colors.grey),
              ),
              sh30,
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "General",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              sh16,
              const Row(
                children: [
                  Icon(Icons.person_2_outlined),
                  sw8,
                  Text("My Profile"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              sh8,
              const Divider(),
              sh16,
              const Row(
                children: [
                  Icon(Icons.message_outlined),
                  sw8,
                  Text("My Tasks"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              sh8,
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

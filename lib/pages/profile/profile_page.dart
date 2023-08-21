import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Text("Profile"), Image.asset("assets/users/p1.png")],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_app/pages/base.dart';
import 'package:task_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: GoogleFonts.lato().fontFamily),
      home: const BaseScreen(),
    );
  }
}

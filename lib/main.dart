import 'package:flutter/material.dart';
import 'package:task_app/models/dummy/chat_list.dart';
import 'package:task_app/models/dummy/task_list.dart';
import 'package:task_app/pages/base.dart';
import 'package:task_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TaskList()),
    ChangeNotifierProvider(create: (_) => ChatList()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Task App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            fontFamily: GoogleFonts.poppins().fontFamily),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            fontFamily: GoogleFonts.poppins().fontFamily),
        home: const BaseScreen(),
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ]);
  }
}

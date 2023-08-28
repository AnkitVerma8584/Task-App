import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/pages/calendar/calendar_page.dart';
import 'package:task_app/pages/message/message_page.dart';
import 'package:task_app/pages/profile/profile_page.dart';
import 'package:task_app/pages/task_add/task_add_screen.dart';
import 'package:task_app/theme/colors.dart';
import 'home/home_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int selectedIndex = 0;
  var screens = const [
    HomePage(),
    CalendarPage(),
    MessagePage(),
    ProfilePage()
  ];

  Color? getColor(isSelected) {
    return isSelected ? getColorsScheme(context).primary : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: screens[selectedIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TaskAddScreen()));
            },
            tooltip: 'New Task',
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomAppBar(
              notchMargin: 6.0,
              shape: const CircularNotchedRectangle(),
              clipBehavior: Clip.antiAlias,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                        onPressed: () => setState(() {
                              selectedIndex = 0;
                            }),
                        icon: Icon(Icons.home_outlined,
                            color: getColor(selectedIndex == 0))),
                    IconButton(
                        onPressed: () => setState(() {
                              selectedIndex = 1;
                            }),
                        icon: Icon(CupertinoIcons.calendar,
                            color: getColor(selectedIndex == 1))),
                    sw12,
                    IconButton(
                        onPressed: () => setState(() {
                              selectedIndex = 2;
                            }),
                        icon: Icon(Icons.message_outlined,
                            color: getColor(selectedIndex == 2))),
                    IconButton(
                        onPressed: () => setState(() {
                              selectedIndex = 3;
                            }),
                        icon: Icon(Icons.person_4_outlined,
                            color: getColor(selectedIndex == 3))),
                  ]),
            ),
          )),
    );
  }
}

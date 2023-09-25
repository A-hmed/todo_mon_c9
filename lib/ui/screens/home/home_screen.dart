import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_mon_c9/ui/bottom_sheets/add_bottom_sheet.dart';
import 'package:todo_mon_c9/ui/screens/home/tabs/list/list_tab.dart';
import 'package:todo_mon_c9/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:todo_mon_c9/ui/screens/home/todo_widget.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    ListTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("To Do List"),
          toolbarHeight: MediaQuery.of(context).size.height * .08,
        ),
        body: tabs[currentTabIndex],
        floatingActionButton: buildFab(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildBottomNav() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          onTap: (index){
            currentTabIndex = index;
            setState(() {});
          },
          currentIndex: currentTabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      );

  Widget buildFab(BuildContext context) => FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddBottomSheet()));
            });
      },
      child: const Icon(Icons.add));
}

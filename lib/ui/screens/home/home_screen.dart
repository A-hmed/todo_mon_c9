import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mon_c9/model/app_user.dart';
import 'package:todo_mon_c9/providers/list_provider.dart';
import 'package:todo_mon_c9/ui/bottom_sheets/add_bottom_sheet.dart';
import 'package:todo_mon_c9/ui/screens/auth/login/login_screen.dart';
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
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("${AppUser.currentUser!.username}"),
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          actions: [
            InkWell(
                onTap: (){
                  provider.todos.clear();
                  AppUser.currentUser = null;
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
                child: Icon(Icons.logout))
          ],
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

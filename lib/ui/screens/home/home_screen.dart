import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_mon_c9/ui/bottom_sheets/add_bottom_sheet.dart';
import 'package:todo_mon_c9/ui/screens/home/todo_widget.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
      floatingActionButton: buildFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget body(BuildContext context) => Stack(
        children: [
          Column(children: [
            AppBar(
              title: const Text("To Do List"),
              toolbarHeight: MediaQuery.of(context).size.height * .2,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .08),
                child: ListView.builder(
                    itemCount: 10, itemBuilder: (_, index) => TodoWidget()),
              ),
            ),
          ]),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
            child: CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
              showYears: true,
              leftMargin: 20,
              monthColor: AppColors.white,
              dayColor: AppColors.primiary,
              dotsColor: AppColors.transparent,
              activeDayColor: AppColors.lightBlack,
              activeBackgroundDayColor: AppColors.white,
            ),
          ),
        ],
      );

  Widget buildBottomNav() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
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

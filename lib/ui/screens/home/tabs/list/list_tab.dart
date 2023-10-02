import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mon_c9/model/todo_dm.dart';
import 'package:todo_mon_c9/providers/list_provider.dart';
import 'package:todo_mon_c9/ui/screens/home/todo_widget.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {provider.getTodosFromFirestore();});

  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .14,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      color: AppColors.primiary,
                    )),
                Expanded(
                    flex: 7,
                    child: Container(
                      color: AppColors.accent,
                    ))
              ],
            ),
            CalendarTimeline(
              initialDate: provider.selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                provider.selectedDate = date;
                provider.getTodosFromFirestore();
              },
              leftMargin: 20,
              monthColor: AppColors.white,
              dayColor: AppColors.primiary,
              dotsColor: AppColors.transparent,
              activeDayColor: AppColors.lightBlack,
              activeBackgroundDayColor: AppColors.white,
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (_, index) => TodoWidget(
                provider.todos[index])
        ),
      ),
    ]);
  }

}

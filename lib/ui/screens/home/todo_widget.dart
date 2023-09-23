import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';
import 'package:todo_mon_c9/ui/utils/app_theme.dart';

class TodoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Slidable(
      key: Key("0"),
      startActionPane:  ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .3,
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * .12,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            const VerticalDivider(
              thickness: 5,
              color: AppColors.primiary,
            ),
            const SizedBox(width: 12,),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text("Play basket Ball", style: AppTheme.taskTitleTextStyle,),
                  SizedBox(height: 12,),
                  Text("Todo description", style: AppTheme.taskDescriptionTextStyle,)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primiary
              ),
              child:  const Icon(Icons.check, color: AppColors.white, size: 32,),
            ),
          ],
        ),
      ),
    );
  }
}

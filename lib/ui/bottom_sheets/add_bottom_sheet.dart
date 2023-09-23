import 'package:flutter/material.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';
import 'package:todo_mon_c9/ui/utils/app_theme.dart';
import 'package:todo_mon_c9/ui/widgets/my_textfield.dart';

class AddBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          const Text("Add new task",textAlign: TextAlign.center, style: AppTheme.bottomSheetTitleTextStyle,),
          const SizedBox(height: 8,),
          const MyTextField(hintText: "Enter task title"),
          const SizedBox(height: 8,),
          const MyTextField(hintText: "Enter task description"),
          const SizedBox(height: 22,),
          const Text("Select date",textAlign: TextAlign.start, style: AppTheme.bottomSheetTitleTextStyle),
          const SizedBox(height: 14,),
          Text("9/21/2023",textAlign: TextAlign.center ,
            style: AppTheme.bottomSheetTitleTextStyle.copyWith(
            color: AppColors.lightBlack,
            fontSize: 16
          ),),
          const Spacer(),
          ElevatedButton(onPressed: (){},
              child: const Text("Add"))
        ],
      ),
    );
  }
}

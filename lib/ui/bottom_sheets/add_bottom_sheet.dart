import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mon_c9/model/todo_dm.dart';
import 'package:todo_mon_c9/providers/list_provider.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';
import 'package:todo_mon_c9/ui/utils/app_theme.dart';
import 'package:todo_mon_c9/ui/widgets/my_textfield.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          const Text("Add new task",textAlign: TextAlign.center, style: AppTheme.bottomSheetTitleTextStyle,),
          const SizedBox(height: 8,),
          MyTextField(controller: titleController,hintText: "Enter task title"),
          const SizedBox(height: 8,),
          MyTextField(controller: descriptionController,
              hintText: "Enter task description"),
          const SizedBox(height: 22,),
          const Text("Select date",textAlign: TextAlign.start, style: AppTheme.bottomSheetTitleTextStyle),
          const SizedBox(height: 14,),
          InkWell(
            onTap: (){
              showMyDatePicker();
            },
            child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
              ,textAlign: TextAlign.center ,
              style: AppTheme.bottomSheetTitleTextStyle.copyWith(
              color: AppColors.lightBlack,
              fontSize: 16
            ),),
          ),
          const Spacer(),
          ElevatedButton(onPressed: (){
            addTaskToFirestore();
          },
              child: const Text("Add"))
        ],
      ),
    );
  }

  void addTaskToFirestore() {
    CollectionReference todoCollectionRef = FirebaseFirestore.instance.collection(
      TodoDM.collectionName
    );

     DocumentReference documentReference = todoCollectionRef.doc();
    documentReference.set({
      "id": documentReference.id,
      "title": titleController.text,
      "description": descriptionController.text,
      "date": selectedDate.millisecondsSinceEpoch,
      "isDone": false
    }).then((value) => null)
        .timeout(Duration(milliseconds: 500), onTimeout: (){
        provider.getTodosFromFirestore();
      Navigator.pop(context);
    });
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    )??selectedDate;
    setState(() {});
  }
}

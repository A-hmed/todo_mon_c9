import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_mon_c9/model/todo_dm.dart';

class ListProvider extends ChangeNotifier{
  List<TodoDM> todos = [];
  DateTime selectedDate = DateTime.now();

  getTodosFromFirestore() async {
    todos.clear();
    CollectionReference todosCollection =
    FirebaseFirestore.instance.collection(TodoDM.collectionName);
    QuerySnapshot querySnapshot = await todosCollection.
        orderBy("date", descending: true).get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    for (int i = 0; i < docs.length; i++) {
      TodoDM todoDM = TodoDM.fromJson(docs[i].data() as Map);
      if(todoDM.date.year == selectedDate.year && todoDM.date.month == selectedDate.month
       && todoDM.date.day == selectedDate.day){
        todos.add(todoDM);
      }
    }
    notifyListeners();
  }
}
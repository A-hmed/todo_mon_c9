class TodoDM {
  static const collectionName = "todos";
  late String id;
  late String title;
  late String description;
  late DateTime date;
  late bool isDone;

  TodoDM({required this.id ,required this.title,
  required this.description,
  required this.date,required this.isDone});

  TodoDM.fromJson(Map json){
    print("Json: $json");
    id = json["id"]??"12345";
    title = json["title"];
    description = json["description"];
    date = DateTime.fromMillisecondsSinceEpoch(json["date"]);
    isDone = json["isDone"];
  }
}
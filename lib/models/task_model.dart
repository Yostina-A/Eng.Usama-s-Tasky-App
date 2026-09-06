class TaskModel {
  //variables:
  final int id;
  String taskName;
  String taskDescription;
  bool isHighPriority;
  bool isDone;

  //defualt contructor:
  TaskModel({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
    this.isDone = false,
  });

  //factory constructor to convert back from json
  factory TaskModel.fromJson(Map <String, dynamic> json){
    return TaskModel(
      id: json["id"],
      taskName: json["taskName"], 
      taskDescription: json["taskDescription"], 
      isHighPriority: json["isHighPriority"],
      isDone: json["isDone"] ?? false,
      );


  }

  //convert properties to map/json
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "taskName": taskName,
      "taskDescription": taskDescription,
      "isHighPriority": isHighPriority,
      "isDone": isDone,
    };
  }
}

class TaskModel {
  //variables:
  String taskName;
  String taskDescription;
  bool isHighPriority;

  //defualt contructor:
  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
  });

  //factory constructor to convert back from json
  factory TaskModel.fromJson(Map <String, dynamic> json){
    return TaskModel(
      taskName: json["taskName"], 
      taskDescription: json["taskDescription"], 
      isHighPriority: json["isHighPriority"]);

  }

  //convert properties to map
  Map<String, dynamic> toMap(){
    return {
      "taskName": taskName,
      "taskDescription": taskDescription,
      "isHighPriority": isHighPriority,
    };
  }
}

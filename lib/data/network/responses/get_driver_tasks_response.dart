import 'package:mobile/data/models/get_driver_tasks_model.dart';

class MyTasksResponse {
  MyTasksResponse({
    this.status,
    this.message,
    this.tasks,
  });

  int? status;
  String? message;
  List<MyTasksModel>? tasks;

  factory MyTasksResponse.fromJson(Map<String, dynamic> json) =>
      MyTasksResponse(
        status: json["status"],
        message: json["message"],
        tasks: json["tasks"] != null
            ? List<MyTasksModel>.from(
                json["tasks"].map((x) => MyTasksModel.fromJson(x)))
            : json["tasks"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}

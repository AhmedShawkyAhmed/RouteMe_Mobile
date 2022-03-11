import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Tasks {


  int? taskId;
  String? orderId;
  String? status;
  String? state;
  int? driverId;


  Tasks({this.taskId, this.orderId this.status, this.state, this.driverId});

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}
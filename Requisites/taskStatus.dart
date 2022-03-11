

import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Status {
  int? taskId;
  String? orderId;
  String? status;
  String? state;

  Status({this.taskId, this.orderId, this.orderId, this.status, this.state });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
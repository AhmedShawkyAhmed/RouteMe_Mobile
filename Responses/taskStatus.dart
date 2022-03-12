import 'package:json_annotation/json_annotation.dart';

import task;

Task t1 = new task();
@JsonSerializable()
class Status {
  int? code;
  String? message;
  String? task;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}



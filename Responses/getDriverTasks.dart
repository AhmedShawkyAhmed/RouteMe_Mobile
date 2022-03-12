import 'package:json_annotation/json_annotation.dart';

import task;

Task t1 = new task();
@JsonSerializable()
class Driver {
  int? code;
  String? message;
  String? task;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Driver {
  int? code;
  String? message;
  String? Task.Dart;


  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

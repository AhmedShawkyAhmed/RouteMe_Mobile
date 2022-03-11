

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Driver {


  int? driverId;

  Driver({this.driverId});

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
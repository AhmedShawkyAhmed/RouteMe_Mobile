import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Status {
  int? id;
  String? nameAr;

  Status({this.id, this.nameAr});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}



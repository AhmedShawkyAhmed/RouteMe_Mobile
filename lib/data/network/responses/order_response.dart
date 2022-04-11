import 'package:mobile/data/models/account_model.dart';

class OrderResponse {
  OrderResponse({
    this.status,
    this.message,
    this.orders,
  });

  int? status;
  String? message;
  List<AccountModel>? orders;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    status: json["status"],
    message: json["message"],
    orders: json["orders"] != null ? List<AccountModel>.from(json["orders"].map((x) => AccountModel.fromJson(x))) : json["orders"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}
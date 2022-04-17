class MyTasksModel {
  int id;
  String orderNumber;
  int dispatcherId;
  int driverId;
  String clientName;
  String clientPhone;
  int itemCount;
  double price;
  int vendorId;
  int branchId;
  double lon;
  double lat;
  String address;
  String start;
  String end;
  String comment;
  String status;

  MyTasksModel({
    required this.id,
    required this.orderNumber,
    required this.dispatcherId,
    required this.driverId,
    required this.clientName,
    required this.clientPhone,
    required this.itemCount,
    required this.price,
    required this.vendorId,
    required this.branchId,
    required this.lon,
    required this.lat,
    required this.address,
    required this.start,
    required this.end,
    required this.comment,
    required this.status,
  });

  factory MyTasksModel.fromJson(Map<String, dynamic> json) => MyTasksModel(
        id: json["id"],
        orderNumber: json["orderNumber"],
        dispatcherId: json["dispatcherId"],
        driverId: json["driverId"],
        lon: json['lon'] == null ? 0.0 : json['lon'].toDouble(),
        lat: json['lat'] == null ? 0.0 : json['lat'].toDouble(),
        clientName: json["clientName"],
        price: json['price'] == null ? 0.0 : json['price'].toDouble(),
        clientPhone: json["clientPhone"],
        itemCount: json["itemCount"],
        comment: json["comment"],
        vendorId: json["vendorId"],
        branchId: json["branchId"],
        address: json["address"],
        start: json["start"],
        end: json["end"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderNumber": orderNumber,
        "dispatcherId": dispatcherId,
        "driverId": driverId,
        "comment": comment,
        "itemCount": itemCount,
        "clientName": clientName,
        "clientPhone": clientPhone,
        "lon": lon,
        "lat": lat,
        "address": address,
        "price": price,
        "vendorId": vendorId,
        "branchId": branchId,
        "start": start,
        "end": end,
        "status": status,
      };
}

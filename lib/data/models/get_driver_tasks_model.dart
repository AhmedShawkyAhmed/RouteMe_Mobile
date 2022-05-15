class MyTasksModel {
  int id;
  String server;
  int orderNumber;
  int dispatcherId;
  int driverId;
  String driver;
  String clientName;
  String clientPhone;
  int itemCount;
  double price;
  int vendorId;
  String branch;
  double lon;
  double lat;
  String vendor;
  String address;
  String start;
  String end;
  String comment;
  String status;

  MyTasksModel({
    required this.id,
    required this.server,
    required this.orderNumber,
    required this.dispatcherId,
    required this.driverId,
    required this.clientName,
    required this.clientPhone,
    required this.itemCount,
    required this.price,
    required this.vendor,
    required this.driver,
    required this.vendorId,
    required this.branch,
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
        server: json["server"],
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
        branch: json["branch"],
        vendor: json["vendor"],
        driver: json["driver"],
        address: json["address"],
        start: json["start"],
        end: json["end"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "server": server,
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
        "branch": branch,
        "driver": driver,
        "vendor": vendor,
        "start": start,
        "end": end,
        "status": status,
      };
}

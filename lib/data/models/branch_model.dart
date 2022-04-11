class BranchModel {
  int? id;
  int? vendorId;
  String? branchName;
  String? phone;
  String? lon;
  String? lat;
  String? address;

  BranchModel({
     this.id,
     this.vendorId,
     this.branchName,
     this.phone,
     this.lon,
     this.lat,
     this.address,
  });
  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
    id: json["id"],
    vendorId: json["vendorId"],
    branchName: json["branchName"],
    phone: json["phone"],
    lon: json["lon"],
    lat: json["lat"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendorId": vendorId,
    "branchName": branchName,
    "phone": phone,
    "lon": lon,
    "lat": lat,
    "address": address,
  };

}
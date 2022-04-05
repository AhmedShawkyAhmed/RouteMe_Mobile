// class LoginModel{
//   // bool? status;
//   // String? message;
//   UserData? data;

//   LoginModel.fromJson(Map<String , dynamic> json)
//   {
    
//     data = json["data"] != null ? UserData.fromJson(json["data"]) : null;
//   }
// }

// class UserData {
//   int? id;
//   String? name;
//   String? server;
//   String? email;
//   String? password;
//   String? phone;
//   String? type;


//   UserData.fromJson(Map<String , dynamic> json)
//   {
//     id = json["id"];
//     name = json["name"];
//     server = json["server"];
//     email = json["email"];
//     password = json["password"];
//     phone = json["phone"];
//     type = json["type"];
    
//   }
// }
import 'dart:convert';


LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.user,
  });

  int? status;
  String? message;
  List<AccountModel>? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    message: json["message"],
    user: List<AccountModel>.from(json["user"].map((x) => AccountModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": List<dynamic>.from(user!.map((x) => x.toJson())),
  };
}

class AccountModel {
  int id;
  String name;
  String server;
  String email;
  String password;
  String phone;
  String type;

  AccountModel({
    required this.id,
    required this.name,
    required this.server,
    required this.email,
    required this.password,
    required this.phone,
    required this.type,
  });
  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    id: json["id"],
    name: json["name"],
    server: json["server"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "server": server,
    "email": email,
    "password": password,
    "phone": phone,
    "type": type,
  };

}
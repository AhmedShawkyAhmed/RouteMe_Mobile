class LoginModle{
  bool? status;
  String? message;
  UserData? query;

  LoginModle.fromJSON(Map<String , dynamic> json)
  {
    
    query = json["query"] != null ? UserData.fromJSON(json["query"]) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? server;
  String? email;
  String? password;
  String? phone;
  String? type;


  UserData.fromJSON(Map<String , dynamic> json)
  {
    id = json["id"];
    name = json["name"];
    server = json["server"];
    email = json["email"];
    password = json["password"];
    phone = json["phone"];
    type = json["type"];
    
  }
}
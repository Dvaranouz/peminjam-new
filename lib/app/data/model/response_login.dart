/// success : true
/// message : "Login Sukses"
/// data : {"token":"3|SvPGz8cHPhcXJT6Q36bqo8foUivViJXafvStLrwpfd1adc96","name":"alif","email":"alif@gmail.com"}

class ResponseLogin {
  ResponseLogin({
    this.success,
    this.message,
    this.data,
  });

  ResponseLogin.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
  }

  bool? success;
  String? message;
  DataLogin? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// token : "3|SvPGz8cHPhcXJT6Q36bqo8foUivViJXafvStLrwpfd1adc96"
/// name : "alif"
/// email : "alif@gmail.com"

class DataLogin {
  DataLogin({
    this.token,
    this.id,
    this.name,
    this.email,
  });

  DataLogin.fromJson(dynamic json) {
    token = json['token'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  String? token;
  int? id;
  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}

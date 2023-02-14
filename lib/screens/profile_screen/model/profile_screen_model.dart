// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.username,
    required this.type,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.specialization,
    required this.degree,
  });

  int id;
  String email;
  String username;
  String type;
  String firstName;
  String lastName;
  int phone;
  String address;
  String specialization;
  String degree;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        type: json["type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        address: json["address"],
        specialization: json["specialization"],
        degree: json["degree"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "type": type,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "specialization": specialization,
        "degree": degree,
      };
}

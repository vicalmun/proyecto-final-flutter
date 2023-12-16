// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'dart:convert';

UserResponse userResponseFromMap(String str) =>
    UserResponse.fromMap(json.decode(str));

String userResponseToMap(UserResponse data) => json.encode(data.toMap());

class UserResponse {
  String message;
  String token;

  UserResponse({
    required this.message,
    required this.token,
  });

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
      };
}

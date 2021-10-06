// Dart imports:
import 'dart:convert';

List<User> UserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String UserToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.username,
    this.password,
  });

  String username;
  String password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"],
      password: json["password"],
    );
  }

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}

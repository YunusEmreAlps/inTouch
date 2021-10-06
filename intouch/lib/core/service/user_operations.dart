// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:intouch/core/model/user.dart';

class UserOperations {
  String base_url = "192.168.2.36:3000";

  Future<List<User>> fetchAllUsers() async {
    final response = await http.get(new Uri.http(base_url, "/user"));
    if (response.statusCode == 200) {
      List<User> users = new List<User>();
      users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<User>> loginUser(String username, String password) async {
    var response = await http.post(new Uri.http(base_url, "/user/login"),
        body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      List<User> users = new List<User>();
      users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      return users;
    } else {
      throw Exception('Failed to login users');
    }
  }
}

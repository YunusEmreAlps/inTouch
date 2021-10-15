// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:intouch/core/model/user.dart';

class UserOperations with DioMixin implements Dio {
  Dio dio = new Dio();
  String baseUrl;

  // Initalization
  /*UserOperations._init() {
    if (Platform.isIOS) {
      baseUrl = "https://intouch-server.herokuapp.com";
    } else {
      baseUrl = "https://intouch-server.herokuapp.com";
    }
    this.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    httpClientAdapter = DefaultHttpClientAdapter();
    this.interceptors.add(LogInterceptor(responseBody: true));
  }



  Future<List<User>> fetchAllUsers() async {
    final response = await http.get(new Uri.http(baseUrl, "/user"));
    if (response.statusCode == 200) {
      List<User> users = new List<User>();
      users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }*/

  // Login User
  login(username, password) async {
    try {
      return await dio.post('https://intouch-server.herokuapp.com/authenticate',
          data: {'username': username, 'password': password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data["msg"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFD9534F),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  // Add User
  register(username, password) async {
      return await dio.post('https://intouch-server.herokuapp.com/adduser',
          data: {'username': username, 'password': password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
  }
  // Get Info
  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://intouch-server.herokuapp.com/getinfo');
  }

  // Post Location
  postlocation(username, latitude, longitude) async {
    return await dio.post('https://intouch-server.herokuapp.com/addlocation',
      data: {"username": username, 'latitude': latitude, 'longitude': longitude},
      options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}

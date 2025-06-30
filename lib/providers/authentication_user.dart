import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  final String API_URL = 'http://animalitospharma-001-site1.ltempurl.com';
  late String _username;
  late String _token;
  late List<dynamic> _permissions;
  bool _isLogged = false;

  String get username => _username;
  String get token => _token;
  List<dynamic> get permissions => _permissions;
  bool get isLogged => _isLogged;

  Future<void> login({required String username, required String password}) async{
    final response = await http.post(
      Uri.parse('$API_URL/Authorization/SignIn'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final Map<String, dynamic> responseData = jsonList[0];
      final List<dynamic> resultObject = responseData['resultObject'];

      _username = resultObject[0]['username'];
      _token = resultObject[0]['token'];
      _permissions = resultObject[0]['permissions'];
      _isLogged = true;
    }
  }
}

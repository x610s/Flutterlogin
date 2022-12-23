import 'dart:convert';
import 'package:fh_login/models/user_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _password = 'nirva_+r';
  String _email = 'jm@gmail.com';
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final storage = const FlutterSecureStorage();

  String? ValidateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Esto no es un correo';
  }

  LoginProvider();

  String get email {
    return _email;
  }

  set email(String value) {
    _email = value;
  }

  String get password {
    return _password;
  }

  set password(String value) {
    _password = value;
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'password: $_password, Correo $_email';
  }

  /* Metodos Http */
  Future<String?> Login() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      var url = Uri.parse("${dotenv.env['api_url']!}/login");
      Response response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({'Email': _email, 'Password': _password}));
      UserToken token = UserTokenResponse.fromJson(response.body).userToken;
      await storage.write(key: 'token', value: token.token);
      await storage.write(
          key: 'expiration', value: token.expiration.toString());
      return await storage.read(key: 'token');
    } catch (e) {
      isLoading = false;
      throw Exception(e);
    }
  }

  Future<void> PruebaAuth() async {
    try {
      var url = Uri.parse(
        "${dotenv.env['api_url']!}/login",
      );
      var bear = await storage.read(key: 'token');
      Response response = await http.get(url,
          headers: {"Content-Type": "application/json", 
          'Authorization': 
          "Bearer $bear"
          });
      print(response.statusCode);
    } catch (e) {
      isLoading = false;
      throw Exception(e);
    }
  }

  Future<bool> isLoged() async {
    try {
      return await storage.read(key: 'token') != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> Logout() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      throw Exception();
    }
  }
}

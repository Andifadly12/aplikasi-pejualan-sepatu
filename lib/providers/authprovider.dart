import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  UserMadel _user;

  UserMadel get user => _user;

  set user(UserMadel) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {String name, String username, String email, String password}) async {
    try {
      UserMadel user = await AuthService().register(
          name: name, username: username, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String email, String password}) async {
    try {
      UserMadel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

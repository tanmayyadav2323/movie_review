import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../config/session_helper.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    description: "",
    email: "",
    imageUrl: "",
    name: "",
    phone: "",
    password: "",
    token: "",
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);

    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  User getUser() {
    return _user;
  }
}

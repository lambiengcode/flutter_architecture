import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void loginMapUser(User user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}

UserProvider userProvider = UserProvider();

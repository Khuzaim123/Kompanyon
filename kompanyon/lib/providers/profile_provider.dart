import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String _fullName = 'Jay mohammed';
  String _email = 'ao.dsgnr@gmail.com';

  String get fullName => _fullName;
  String get email => _email;

  void updateProfile(String name, String email) {
    _fullName = name;
    _email = email;
    notifyListeners();
  }
}

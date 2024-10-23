import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class AuthProvider extends ChangeNotifier {
  String? _token;

  // Fonction pour définir le token
  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
  void clearToken(){
    _token = null;
    notifyListeners();
  }

  // Fonction pour récupérer le token
  String? getToken() {
    return _token;
  }
}

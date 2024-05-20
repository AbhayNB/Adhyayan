import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../screens/login.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  String? _userName;
  String? _userEmail;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String? get user {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _userId;
    }
    return null;
  }

  Future<void> fetchUserDetails() async {
    if (_userId == null) return;

    final url = Uri.https(
        'adhyayan-90a7e-default-rtdb.firebaseio.com', 'users/$_userId.json');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final userMap = responseData.values.first as Map<String, dynamic>;
      final name = userMap['name'];
      final email = userMap['email'];
      _userName = name;
      _userEmail = email;
      notifyListeners();
    } else {
      throw Exception('Failed to load user details');
    }
  }

  String? get userName => _userName;
  String? get userEmail => _userEmail;
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyDshNDWlRTRK8pZ1WJM1UHR1TfYQVVoTHo');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw HttpException('Authentication failed');
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'verifyPassword');
  }

  void logout() {
    _token = null;
    _userId = null;
    _expiryDate = null;
    print("logged out");
    notifyListeners();
  }
}

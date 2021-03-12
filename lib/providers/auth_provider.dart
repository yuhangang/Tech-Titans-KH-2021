import 'package:flutter/cupertino.dart';
import 'package:tech_titans/core/app_preference.dart';
import 'package:tech_titans/screens/login/login_page.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({required User? user}) : this._user = user;
  User? _user;
  bool get isAuth => _user != null ? true : false;
  Future<bool> login({required String name, required String email}) async {
    try {
      _user = User(userName: name, userEmail: email);
    } catch (e) {
      return false;
    }
    if (_user != null) AppPreference.saveUserData(_user!);
    notifyListeners();
    return true;
  }

  Future<bool> logout() async {
    try {
      _user = null;
    } catch (e) {
      return false;
    }

    notifyListeners();
    return true;
  }
}

String getId() => "fergef";

class User {
  final String sId;
  String userName;
  String userEmail;
  User({required this.userName, required this.userEmail, userId})
      : sId = userId ?? getId();

  User._({required this.userName, required this.userEmail, required userId})
      : sId = userId;

  factory User.fromJson(Map<String, dynamic> json) {
    return new User._(
        userEmail: json["user_email"],
        userName: json["user_name"],
        userId: json['user_id']!);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_email"] = this.userEmail;
    data["user_name"] = this.userName;
    data["user_id"] = this.sId;
    return data;
  }
}

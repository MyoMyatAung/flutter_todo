import 'package:flutter/foundation.dart';
import 'package:flutter_todo/static/ip_address.dart';
import 'package:flutter_todo/static/secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  var jwt = "";

  Future<String> get jwtOrEmpty async {
    jwt = await SecureStorage.storage.read(key: "jwt");
    print(jwt);
    if (jwt == null) return "";
    return jwt;
  }

  Future<int> attemptSignUp(String username, String password) async {
    var res = await http.post('http://${IPAddress.IP_ADDRESS}:3000/signup',
        body: {"username": username, "password": password});
    return res.statusCode;
  }

  Future<String> attemptLogin(String username, String password) async {
    var res = await http.post('http://${IPAddress.IP_ADDRESS}:3000/login',
        body: {"username": username, "password": password});
    if (res.statusCode == 200) return res.body;
    return null;
  }
}

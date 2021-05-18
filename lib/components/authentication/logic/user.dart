import 'package:flutter_secure_storage/flutter_secure_storage.dart';

createUser(String email, String password, String username) async {
  String url = 'http://192.168.43.161:8000/api/accounts/create/';
}

Future<bool> isLoggedIn() {
  final storage = FlutterSecureStorage();
  Future<bool> isLoggedIn = storage.containsKey(key: 'token');
  return isLoggedIn;
}

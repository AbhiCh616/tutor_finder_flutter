import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> isLoggedIn() {
  final storage = FlutterSecureStorage();
  Future<bool> isLoggedIn = storage.containsKey(key: 'token');
  return isLoggedIn;
}

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor_finder_flutter/components/registration/utils/constants.dart';

createUser(String email, String password) async {
  Uri url = Uri.parse(BASE_URL + '/api/accounts/create/');
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({'email': email, 'password': password});
  var response = await http.post(url, headers: headers, body: body);

  // User created
  if (response.statusCode == 201) {
    var data = jsonDecode(response.body);
    // Create storage
    final storage = new FlutterSecureStorage();
    // Write value
    await storage.write(key: 'token', value: data['token']);
    // Debug messages
    var token = await storage.read(key: 'token');
    print('User created with token: $token');
  }
  // User not signed up
  else {
    print(
        'Can\'t create user: ${response.statusCode}, sent body: $body, error body: ${response.body}');
  }
}

logIn(String email, String password) async {
  Uri url = Uri.parse(BASE_URL + '/api/accounts/login/');
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({'username': email, 'password': password});
  var response = await http.post(url, headers: headers, body: body);

  // User logged in successfully
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    // Create storage
    final storage = new FlutterSecureStorage();
    // Write value
    await storage.write(key: 'token', value: data['token']);

    // Debug messages
    var token = await storage.read(key: 'token');
    print('User logged in with token: $token');
  }
  // User not logged in
  else {
    print(
        'Can\'t login user: ${response.statusCode}, sent body: $body, error body: ${response.body}');
  }
}

Future<bool> isLoggedIn() {
  final storage = FlutterSecureStorage();
  Future<bool> isLoggedIn = storage.containsKey(key: 'token');
  return isLoggedIn;
}

logOut() async {
  // Delete token
  final storage = new FlutterSecureStorage();
  await storage.delete(key: 'token');
}

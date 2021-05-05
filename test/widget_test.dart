/*
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_finder_flutter/components/authentication/logic/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('User is not logged-in', () async {
    isLoggedIn().then((value) => expect(value, false));
    //expect(await isLoggedIn(), false);
  });

  test('User is logged-in', () async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'token', value: '001');
    bool isUserLoggedIn = await isLoggedIn();
    expect(isUserLoggedIn, true);
  });

  test('Test', () {
    int a = 1;
    expect(a, 1);
  });
}
*/
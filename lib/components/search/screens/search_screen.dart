import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/authentication_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => AuthenticationScreen(),
                  ),
                  ModalRoute.withName('/'),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

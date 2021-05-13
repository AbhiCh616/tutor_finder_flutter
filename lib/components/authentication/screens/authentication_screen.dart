import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/animations/fade_position_animation.dart';
import 'package:tutor_finder_flutter/components/authentication/illustrations/two_people_seating_still.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/signup_screen.dart';

import 'login_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'HELLO',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'boot_illustration',
              child: SizedBox(
                width: (MediaQuery.of(context).size.height / 2.5) * 1.149395,
                height: MediaQuery.of(context).size.height / 2.5,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return TwoPeopleSeatingStill(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    FadePositionAnimation(
                      delay: 1.1,
                      startY: 100,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              pageBuilder: (_, __, ___) => LoginScreen(),
                            ),
                          ),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              pageBuilder: (_, __, ___) => SignupScreen(),
                            ),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

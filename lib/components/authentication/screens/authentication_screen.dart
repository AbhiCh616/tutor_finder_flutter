import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/animations/fade_position_animation.dart';
import 'package:tutor_finder_flutter/components/authentication/illustrations/two_people_seating_still.dart';
import 'login_signup.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Heading
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
            // Illustration
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
            // Text
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FadePositionAnimation(
                delay: 3,
                child: Text(
                  'Connecting teachers and students',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // Buttons
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    // Login button
                    FadePositionAnimation(
                      delay: 1.1,
                      startY: 100,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Hero(
                          tag: 'LOG IN',
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(seconds: 2),
                                pageBuilder: (_, __, ___) =>
                                    LoginScreen('LOG IN'),
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
                    ),
                    // Sign up button
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Hero(
                          tag: 'SIGN UP',
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(seconds: 2),
                                pageBuilder: (_, __, ___) =>
                                    LoginScreen('SIGN UP'),
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

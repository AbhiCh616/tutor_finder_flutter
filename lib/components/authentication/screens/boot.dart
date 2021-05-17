import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/animations/fade_position_animation.dart';
import 'package:tutor_finder_flutter/components/authentication/illustrations/two_people_seating_illustration.dart';
import 'package:tutor_finder_flutter/components/authentication/logic/user.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/authentication_screen.dart';

class BootScreen extends StatefulWidget {
  @override
  _BootScreenState createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3700), () {
      isLoggedIn().then((value) => {
            if (value)
              {}
            else
              {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 2),
                    pageBuilder: (_, __, ___) => AuthenticationScreen(),
                  ),
                ),
              }
          });
    });
  }

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
                child: FadePositionAnimation(
                  delay: 1,
                  startY: 50,
                  child: Text(
                    'HELLO',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Illustration
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 8,
                left: 20,
                right: 20,
              ),
              child: Hero(
                tag: 'boot_illustration',
                child: SizedBox(
                  width: (MediaQuery.of(context).size.height / 2.5) * 1.149395,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return TwoPeopleSeatingIllustration(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

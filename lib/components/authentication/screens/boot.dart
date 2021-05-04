import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/animations/fade_position_animation.dart';
import 'package:tutor_finder_flutter/components/authentication/illustrations/two_people_seating_illustration.dart';

class BootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'HELLO!',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
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
        ],
      ),
    );
  }
}

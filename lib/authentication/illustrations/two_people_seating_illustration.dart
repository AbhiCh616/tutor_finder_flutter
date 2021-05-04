import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/utils/fade_image.dart';

class TwoPeopleSeatingIllustration extends StatelessWidget {
  final double height;
  final double width;

  TwoPeopleSeatingIllustration({
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadePositionImage(
            top: this.height * 0.613467,
            height: this.height * 0.25355,
            width: this.width * 0.235318,
            fadeDelay: 2,
            image: 'assets/illustrations/two_people_seating/Leaf_Lower.png'),
        FadePositionImage(
            left: this.width * 0.1157216,
            top: this.height * 0.521437,
            height: this.height * 0.34509,
            width: this.width * 0.13067,
            fadeDelay: 2.5,
            image: 'assets/illustrations/two_people_seating/Leaf_Upper.png'),
        FadePositionImage(
            left: this.width * 0.123182,
            top: this.height * 0.637596,
            height: this.height * 0.26685,
            width: this.width * 0.275222,
            fadeDelay: 3,
            image: 'assets/illustrations/two_people_seating/Seat.png'),
        FadePositionImage(
            left: this.width * 0.254952,
            top: this.height * 0,
            height: this.height * 0.95191,
            width: this.width * 0.706069,
            fadeDelay: 2,
            image: 'assets/illustrations/two_people_seating/Green_Bubble.png'),
        FadePositionImage(
            left: this.width * 0.806003,
            top: this.height * 0.603097,
            height: this.height * 0.279447,
            width: this.width * 0.193997,
            fadeDelay: 2.5,
            image: 'assets/illustrations/two_people_seating/Pink_Bubble.png'),
        FadePositionImage(
            left: this.width * 0.128358,
            top: this.height * 0.197188,
            height: this.height * 0.720785,
            width: this.width * 0.544169,
            fadeDelay: 4.5,
            fadeX: -100.0,
            image: 'assets/illustrations/two_people_seating/Boy.png'),
        FadePositionImage(
            left: this.width * 0.69907,
            top: this.height * 0.703935,
            height: this.height * 0.26934,
            width: this.width * 0.27782,
            fadeDelay: 3,
            image: 'assets/illustrations/two_people_seating/Seat.png'),
        FadePositionImage(
            left: this.width * 0.469797,
            top: this.height * 0.250565,
            height: this.height * 0.7494,
            width: this.width * 0.50204,
            fadeDelay: 5.5,
            fadeX: 300.0,
            image: 'assets/illustrations/two_people_seating/Girl.png'),
      ],
    );
  }
}

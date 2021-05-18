import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/subject_fees.dart';

class DistancePicker extends StatefulWidget {
  @override
  _DistancePickerState createState() => _DistancePickerState();
}

class _DistancePickerState extends State<DistancePicker> {
  double _distance = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'Travel',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Subheading
                  Text(
                    'How far are you willing to travel from this location to reach your students?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SleekCircularSlider(
                appearance: appearance,
                min: 0,
                max: 10,
                initialValue: _distance,
                onChange: (double value) {
                  setState(() {
                    _distance = value;
                  });
                },
                innerWidget: (double value) {
                  return Center(
                    child: Text(
                      '${value.toStringAsFixed(2)} km',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  );
                },
              ),
              // Next button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                height: 70,
                width: 500,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 2),
                          pageBuilder: (_, __, ___) => SubjectFees(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final customWidth = CustomSliderWidths(
  trackWidth: 5,
  progressBarWidth: 15,
  shadowWidth: 30,
);

final customColors = CustomSliderColors(
  dotColor: Colors.white.withOpacity(0.8),
  trackColor: Color(0xff98DBFC).withOpacity(0.3),
  progressBarColor: Color(0xff6DCFFF),
  shadowColor: Color(0xff98DBFC),
  shadowStep: 15.0,
  shadowMaxOpacity: 0.3,
);

final CircularSliderAppearance appearance = CircularSliderAppearance(
  customWidths: customWidth,
  customColors: customColors,
  startAngle: 270,
  angleRange: 300,
  size: 290.0,
);

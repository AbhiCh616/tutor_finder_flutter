import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/screens/tutor_profile.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: TutorProfile(),
      ),
    );

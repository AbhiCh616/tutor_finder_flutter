import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/boot.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/subject_fees.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: BootScreen(),
      ),
    );

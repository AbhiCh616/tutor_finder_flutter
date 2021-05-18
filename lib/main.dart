import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/basic_info.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/distance_picker.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: BasicInfo(),
      ),
    );

import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/student_search/screens/student_search.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: StudentSearch(),
      ),
    );

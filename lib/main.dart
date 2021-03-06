import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/authentication_screen.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/boot.dart';
import 'package:tutor_finder_flutter/components/student_search/screens/tutor_list.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: AuthenticationScreen(),
      ),
    );

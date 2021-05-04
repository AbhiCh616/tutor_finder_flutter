import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/boot.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BootScreen(),
        ),
      ),
    );

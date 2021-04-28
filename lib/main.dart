import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Text("Hello!"),
          ),
        ),
      ),
    );

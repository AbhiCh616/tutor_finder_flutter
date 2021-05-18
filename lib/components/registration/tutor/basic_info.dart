import 'package:flutter/material.dart';

class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Heading
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Image picker
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child:
                      // Placeholder icon
                      ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 150,
                        maxWidth: 150,
                        minHeight: 150,
                        minWidth: 150),
                    child: ColoredBox(
                      color: Colors.grey.shade200,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
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

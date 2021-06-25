import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/subject_fees.dart';
import 'package:tutor_finder_flutter/components/search/screens/search_screen.dart';

class IDTutReg extends StatefulWidget {
  @override
  _IDTutRegState createState() => _IDTutRegState();
}

class _IDTutRegState extends State<IDTutReg> {
  File? _idImage;
  File? _edImage;
  final picker = ImagePicker();

  Future getIdImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _idImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getEdImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _edImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                    'Verification',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Subheading
                  Text(
                    'Take photo of your id proof and highest education certificate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // Verify button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: getIdImage,
                      child: Container(
                        height: 125,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.green[300],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: Icon(_idImage != null
                                    ? Icons.done
                                    : Icons.camera_alt_outlined),
                              ),
                              Text(
                                'Government ID Proof',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Verify button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: getEdImage,
                      child: Container(
                        height: 125,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.green[300],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: Icon(_edImage != null
                                    ? Icons.done
                                    : Icons.camera_alt_outlined),
                              ),
                              Text(
                                'Highest ed certificate',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Next button
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  width: 500,
                  child: TextButton(
                    onPressed: () {
                      //createTutorProfile();
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 2),
                          pageBuilder: (_, __, ___) => SearchScreen(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
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

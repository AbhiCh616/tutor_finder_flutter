import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/distance_picker.dart';

import 'package:tutor_finder_flutter/components/registration/utils/gender.dart';

class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  File? _image;
  final picker = ImagePicker();
  final nameController = TextEditingController();
  int _currentValue = 18;
  Gender _gender = Gender.None;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Image picker
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: _image != null
                              ? FileImage(_image!)
                              : AssetImage('assets/images/camera.png')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                          width: 130.0,
                          height: 130.0,
                          child: InkWell(
                            onTap: getImage,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Name heading
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 10, bottom: 10),
                    child: Text(
                      'FULL NAME',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Name field
                  TextFormField(
                    style: TextStyle(fontSize: 28),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter here',
                    ),
                  ),
                  // Age heading
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 10),
                    child: Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Age picker
                  NumberPicker(
                    value: _currentValue,
                    minValue: 10,
                    maxValue: 100,
                    onChanged: (value) => setState(() => _currentValue = value),
                    axis: Axis.horizontal,
                    selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                    textStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 40,
                    ),
                    itemHeight: 80,
                  ),
                  // Gender heading
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 10, bottom: 20),
                    child: Text(
                      'GENDER',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          // Male
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _gender == Gender.Male
                                  ? Colors.blue[300]
                                  : Colors.grey[200],
                            ),
                            height: 100,
                            width: 100,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _gender = Gender.Male;
                                  });
                                },
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Image.asset(
                                    _gender == Gender.Male
                                        ? 'assets/images/male_selected.png'
                                        : 'assets/images/male_unselected.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      // Female
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _gender == Gender.Female
                                  ? Colors.pink[300]
                                  : Colors.grey[200],
                            ),
                            height: 100,
                            width: 100,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _gender = Gender.Female;
                                  });
                                },
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    _gender == Gender.Female
                                        ? 'assets/images/female_selected.png'
                                        : 'assets/images/female_unselected.png',
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Other
                  Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _gender == Gender.Other
                                ? Colors.purple[300]
                                : Colors.grey[200],
                          ),
                          height: 100,
                          width: 100,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _gender = Gender.Other;
                                });
                              },
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Image.asset(
                                  _gender == Gender.Other
                                      ? 'assets/images/transgender_selected.png'
                                      : 'assets/images/transgender_unselected.png',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Other',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Next button
                  Container(
                    margin: EdgeInsets.only(top: 30),
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
                              pageBuilder: (_, __, ___) => DistancePicker(),
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
        ),
      ),
    );
  }
}

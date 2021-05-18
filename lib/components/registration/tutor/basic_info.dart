import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  File? _image;
  final picker = ImagePicker();
  final nameController = TextEditingController();
  int _currentValue = 18;

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
        child: Padding(
          padding: const EdgeInsets.all(40.0),
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
              Padding(
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
                    width: 150.0,
                    height: 150.0,
                    child: InkWell(
                      onTap: getImage,
                    ),
                  ),
                ),
              ),
              // Name heading
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 10, bottom: 10),
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
                style: TextStyle(fontSize: 30),
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
                  fontSize: 60,
                ),
                textStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 50,
                ),
                itemHeight: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

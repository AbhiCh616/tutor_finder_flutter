import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  File? _image;
  final picker = ImagePicker();

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
            ],
          ),
        ),
      ),
    );
  }
}

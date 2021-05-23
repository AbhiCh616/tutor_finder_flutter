import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/registration/logic/tutor_registration.dart';
import 'package:tutor_finder_flutter/components/registration/tutor/basic_info.dart';
import 'package:tutor_finder_flutter/components/student_search/screens/student_search.dart';
import 'package:tutor_finder_flutter/components/student_search/screens/tutor_list.dart';

class SubjectFees extends StatefulWidget {
  @override
  _SubjectFeesState createState() => _SubjectFeesState();
}

class _SubjectFeesState extends State<SubjectFees> {
  final addChipController = TextEditingController();
  List<String> subjects = [];
  final costController = TextEditingController();
  String dropdownValue = 'monthly';
  List<String> dropDownOptions = <String>['monthly', 'yearly', 'hourly'];

  @override
  void dispose() {
    addChipController.dispose();
    costController.dispose();
    super.dispose();
  }

  Widget buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < subjects.length; i++) {
      Widget subjectChip = Padding(
        padding: EdgeInsets.only(bottom: 10, right: 10),
        child: InputChip(
          backgroundColor: Colors.blue[50],
          padding: EdgeInsets.all(10.0),
          label: Text(
            subjects[i],
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[400],
            ),
          ),
          onDeleted: () {
            setState(() {
              subjects.removeAt(i);
            });
          },
          deleteIcon: Icon(
            Icons.close_outlined,
          ),
          deleteIconColor: Colors.blue[400],
        ),
      );

      chips.add(subjectChip);
    }

    return Wrap(
      direction: Axis.horizontal,
      children: chips,
    );
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
                    'Subjects',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Subheading
                  Text(
                    'What would you like to teach?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  // Add chip text field
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 12.0),
                    child: TextFormField(
                      controller: addChipController,
                      onFieldSubmitted: (value) {
                        setState(() {
                          subjects.add(value);
                        });
                        addChipController.clear();
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Enter subject here'),
                    ),
                  ),
                  // Subject chips
                  Container(
                    child: buildChips(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subheading
                  Text(
                    'How much would you charge?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Currency sign
                          Text(
                            String.fromCharCode(8377),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                            ),
                          ),
                          // Price field
                          IntrinsicWidth(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 34,
                              ),
                              controller: costController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: '0.00',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Drop down
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            selectedItemBuilder: (BuildContext context) {
                              return dropDownOptions.map((String value) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      dropdownValue,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            items: dropDownOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }).toList(),
                            elevation: 0,
                            dropdownColor: Colors.grey[100],
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
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 2),
                          pageBuilder: (_, __, ___) => StudentSearch(),
                        ),
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

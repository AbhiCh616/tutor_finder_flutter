import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/student_search/models/tutor_brief_info.dart';
import 'package:tutor_finder_flutter/utils/color.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/models/review.dart';

class StudentSearch extends StatefulWidget {
  @override
  _StudentSearchState createState() => _StudentSearchState();
}

class _StudentSearchState extends State<StudentSearch> {
  final searchController = TextEditingController();
  List<String> subjects = [];
  ScrollController _scrollViewController = new ScrollController();

  @override
  void dispose() {
    searchController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  final List<TutorBriefInfo> listData = [
    TutorBriefInfo(
      "Anamika Singh",
      4.1,
      [
        "english",
        "science",
        "maths",
      ],
      5000,
      "Monthly",
      [
        Review(3.4, '16 Mar 19', 'I am very happy'),
        Review(3.4, '16 Mar 19', 'I am very happy'),
      ],
    ),
    /*
    TutorBriefInfo(
        "Abhishek Chouhan",
        4.3,
        [
          "physics",
        ],
        3000,
        "Monthly"),
    TutorBriefInfo(
        "Achal",
        3.0,
        [
          "science",
          "maths",
        ],
        200,
        "Hourly"),
    TutorBriefInfo(
        "Arnav",
        3.3,
        [
          "astrophysics",
          "maths",
          "physics",
        ],
        3000,
        "Monthly"),
    TutorBriefInfo(
        "Abhishek Chouhan",
        4.3,
        [
          "agwg",
          "science",
          "maths",
          "physics",
        ],
        3000,
        "Monthly"),*/
  ];

  Widget buildSubjectChips() {
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
        child: ColoredBox(
          color: hexToColor('#F9FBFE'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0.2,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Search icon
                    Image(
                      image: AssetImage('assets/icons/search.png'),
                      height: 25,
                    ),
                    // Search edit text field
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              subjects.add(value);
                            });
                            searchController.clear();
                          },
                          style: TextStyle(fontSize: 18),
                          controller: searchController,
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
                            hintText: 'Enter subject here',
                          ),
                        ),
                      ),
                    ),
                    // Filter button
                    Image(
                      image: AssetImage('assets/icons/filter.png'),
                      width: 33,
                    ),
                  ],
                ),
              ),
              // Subjects list
              if (subjects.length != 0)
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: buildSubjectChips(),
                ),
              // Tutors list
              Expanded(
                child: ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return _tile(listData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tile(TutorBriefInfo tutorInfo) => Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                Material(
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.transparent,
                  child: Ink.image(
                    image: AssetImage('assets/images/camera.png'),
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                // Charge
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    String.fromCharCode(8377) +
                        ' ' +
                        tutorInfo.charge.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Charge duration
                Text(
                  tutorInfo.chargeDuration.toString().toLowerCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Name
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          child: SizedBox(
                            width: 110,
                            child: Text(
                              tutorInfo.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            // Rating
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 16),
                              child: Text(
                                tutorInfo.rating.toString(),
                                style: TextStyle(
                                  color: Colors.yellow[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                        // Star icon
                      ],
                    ),
                  ),
                  // Subjects
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    child: Container(
                      child: buildTutorChips(tutorInfo.subjects),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildTutorChips(List<String> subjects) {
    List<Widget> chips = [];

    for (int i = 0; i < subjects.length; i++) {
      Widget subjectChip = Padding(
        padding: EdgeInsets.only(right: 8),
        child: Chip(
          backgroundColor: Colors.blue[50],
          padding: EdgeInsets.all(9.0),
          label: Text(
            subjects[i],
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue[400],
            ),
          ),
        ),
      );

      chips.add(subjectChip);
    }

    return Wrap(
      direction: Axis.horizontal,
      children: chips,
    );
  }
}

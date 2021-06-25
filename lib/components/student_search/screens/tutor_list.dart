import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/student_search/models/tutor_brief_info.dart';
import 'package:tutor_finder_flutter/utils/color.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/models/review.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/screens/tutor_profile.dart';

class TutorList extends StatefulWidget {
  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  final List<TutorBriefInfo> tutorBriefInfoList = [
    TutorBriefInfo(
      'Anamika Singh',
      0.0,
      ["english", "science", "maths"],
      5000,
      "Monthly",
      [],
    ),
    TutorBriefInfo(
      'Abhishek Chouhan',
      4.3,
      ["A"],
      100,
      "Hourly",
      [
        Review(4.3, '16 Mar \'19', 'He teaches good!'),
        Review(4.3, '20 Feb \'21',
            'The best thing I liked about his teaching style is the way of the.')
      ],
    ),
    TutorBriefInfo(
      'Achal Yash',
      4,
      ["CS"],
      10000,
      "Yearly",
      [
        Review(5.0, '15 Jan \'20', 'Had been long but he teaches good!'),
        Review(4.0, '20 Feb \'21', 'The best teacher for CS.'),
      ],
    ),
    TutorBriefInfo(
      'Sushmita Tiwari',
      4.3,
      ["A"],
      100,
      "Hourly",
      [
        Review(4.3, '16 Mar \'19', 'He teaches good!'),
        Review(4.3, '20 Feb \'21',
            'The best thing I liked about his teaching style is the way of the.')
      ],
    ),
    TutorBriefInfo(
      'Ray Yash',
      4,
      ["CS"],
      10000,
      "Yearly",
      [
        Review(5.0, '15 Jan \'20', 'Had been long but he teaches good!'),
        Review(4.0, '20 Feb \'21', 'The best teacher for CS.'),
      ],
    ),
    TutorBriefInfo(
      'Aakash Choubey',
      4.3,
      ["A"],
      100,
      "Hourly",
      [
        Review(4.3, '16 Mar \'19', 'He teaches good!'),
        Review(4.3, '20 Feb \'21',
            'The best thing I liked about his teaching style is the way of the.')
      ],
    ),
    TutorBriefInfo(
      'Anand Jain',
      4,
      ["CS"],
      10000,
      "Yearly",
      [
        Review(5.0, '15 Jan \'20', 'Had been long but he teaches good!'),
        Review(4.0, '20 Feb \'21', 'The best teacher for CS.'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#F9FBFE'),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              createHeading(),
              createSearchBar(context),
            ];
          },
          body: ListView.builder(
            itemCount: tutorBriefInfoList.length,
            itemBuilder: (context, index) {
              return createTutorTile(tutorBriefInfoList[index], context);
            },
          ),
        ),
      ),
    );
  }
}

SliverAppBar createHeading() {
  return SliverAppBar(
    elevation: 0,
    backgroundColor: hexToColor('#F9FBFE'),
    expandedHeight: 60,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(top: 20, left: 24.0),
        child: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

SliverAppBar createSearchBar(BuildContext context) {
  return SliverAppBar(
    pinned: false,
    snap: true,
    floating: true,
    elevation: 0,
    backgroundColor: hexToColor('#F9FBFE'),
    expandedHeight: 80,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter subject',
            prefixIcon: IconButton(
              icon: Image.asset(
                'assets/icons/search.png',
                height: 20,
              ),
              onPressed: null,
            ),
            suffixIcon: IconButton(
              icon: Image.asset(
                'assets/icons/filter.png',
                height: 13,
              ),
              onPressed: () {
                showDialog(context: context, builder: (_) => FilterDialog());
              },
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    ),
  );
}

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  RangeValues _currentRangeValues = const RangeValues(0, 10000);
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter & Sort'),
      content: (Column(
        children: [
          Text('Price'),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 10000,
            divisions: 10,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          Text('Min Stars'),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 5,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      )),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(onPressed: () {}, child: Text('Apply')),
      ],
    );
  }
}

SliverAppBar createSearchTagsBar(List<String> subjects) {
  return SliverAppBar(
    pinned: false,
    snap: true,
    floating: true,
    elevation: 0,
    backgroundColor: hexToColor('#F9FBFE'),
    expandedHeight: 80,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(top: 20, left: 24.0),
      ),
    ),
  );
}

Widget createTutorTile(TutorBriefInfo tutorBriefInfo, BuildContext context) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => TutorProfile(tutorBriefInfo.name,
                tutorBriefInfo.rating, tutorBriefInfo.reviews),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: hexToColor('#EBF5FF'),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Stack(
          children: [
            // Profile Pic

            CircleAvatar(
              foregroundImage: NetworkImage('https://via.placeholder.com/150'),
              backgroundColor: Colors.grey,
              radius: 40,
            ),

            // Name

            Positioned(
              left: 104,
              top: 13,
              child: Text(
                tutorBriefInfo.name,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            // Buttons

            // Rating and Charge

            Positioned(
              left: 100,
              top: 43,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    // Star icon

                    WidgetSpan(
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      ),
                    ),

                    // Rating

                    TextSpan(
                      text: ' ' + tutorBriefInfo.rating.toString(),
                    ),

                    // Currency symbol

                    TextSpan(
                      text: '    ' + String.fromCharCode(8377),
                      style: TextStyle(
                        color: Colors.yellow.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    // Charge

                    TextSpan(
                      text: ' ' + tutorBriefInfo.charge.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Charge duration

                    TextSpan(
                      text: '/' +
                          tutorBriefInfo.chargeDuration
                              .toLowerCase()
                              .substring(0, 1),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

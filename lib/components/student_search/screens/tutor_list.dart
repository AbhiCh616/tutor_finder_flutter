import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/registration/utils/constants.dart';
import 'package:tutor_finder_flutter/components/student_search/models/tutor_brief_info.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/models/review.dart';
import 'package:tutor_finder_flutter/utils/color.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/screens/tutor_profile.dart';
import 'package:http/http.dart' as http;

class TutorList extends StatefulWidget {
  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  List<TutorBriefInfo> tutorBriefInfoList = [];

  void fetchTutors() async {
    List<TutorBriefInfo> returnList = [];
    final response =
        await http.get(Uri.parse(BASE_URL + '/api/tutors/tutors/'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // print(data[1]);
      // print(data.runtimeType);
      // var data2 = data.asMap();
      // print(data2.runtimeType);
      // print(data.length);
      // for (var i = 0; i < data.length; i++) {
      //   returnList.add(TutorBriefInfo.fromJson(data[i], 0));
      // }
      if (data != null) {
        data.forEach((v) async {
          var uri = Uri.parse(
              BASE_URL + '/api/tutors/get-rating/?tutor_id=${v['id']}');
          var resRate = await http.get(uri);
          double rating = json.decode(resRate.body)['rating__avg'];
          rating = double.parse(rating.toStringAsFixed(2));
          //print(resRate.body);

          List<Review> reviewsList = [];
          // final response3 = await http.get(Uri.parse(
          //     'http://10.0.2.2:8000/api/tutors/get-reviews/?tutor_id=129'));

          // if (response3.statusCode == 200) {
          //   var data = json.decode(response3.body);
          //   if (data != null) {
          //     data.forEach((v) {
          //       reviewsList.add(Review.fromJson(v));
          //     });
          //   }
          // }

          returnList.add(TutorBriefInfo.fromJson(v, rating, reviewsList));
        });
      }
    }

    setState(() {
      tutorBriefInfoList = returnList;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTutors();
  }

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
            pageBuilder: (_, __, ___) => TutorProfile(
                tutorBriefInfo.name, tutorBriefInfo.rating, tutorBriefInfo.id),
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
                      text: ' ' +
                          tutorBriefInfo.subjectBundles[0].charge.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Charge duration

                    TextSpan(
                      text: '/' +
                          tutorBriefInfo.subjectBundles[0].chargeCycle
                              .toString(),
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

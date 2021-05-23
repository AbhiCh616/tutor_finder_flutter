import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/student_search/models/tutor_brief_info.dart';
import 'package:tutor_finder_flutter/utils/color.dart';

class TutorList extends StatefulWidget {
  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  final List<TutorBriefInfo> tutorBriefInfoList = [
    TutorBriefInfo('Abhishek Chouhan', 4.3, ["A"], 5000, "Monthly")
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
              createSearchBar(),
            ];
          },
          body: ListView.builder(
            itemCount: tutorBriefInfoList.length,
            itemBuilder: (context, index) {
              return createTutorTile(tutorBriefInfoList[index]);
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

SliverAppBar createSearchBar() {
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
              onPressed: () {},
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

Widget createTutorTile(TutorBriefInfo tutorBriefInfo) => Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
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
    );

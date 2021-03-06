import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/registration/utils/constants.dart';
import 'package:tutor_finder_flutter/utils/color.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/models/review.dart';
import 'package:http/http.dart' as http;

class TutorProfile extends StatefulWidget {
  final String name;
  final double averageRating;
  final int id;

  TutorProfile(this.name, this.averageRating, this.id);

  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  List<Review> reviews = [];

  void fetchReviews() async {
    List<Review> reviewsList = [];
    final response3 = await http.get(
        Uri.parse(BASE_URL + '/api/tutors/get-reviews/?tutor_id=${widget.id}'));

    if (response3.statusCode == 200) {
      var data = json.decode(response3.body);
      if (data != null) {
        data.forEach((v) {
          reviewsList.add(Review.fromJson(v));
        });
      }
    }

    setState(() {
      reviews = reviewsList;
    });
  }

  @override
  void initState() {
    fetchReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#F9FBFE'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Pic
            Padding(
              padding: const EdgeInsets.only(top: 36, bottom: 16),
              child: CircleAvatar(
                foregroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.grey,
                radius: 48,
              ),
            ),
            Container(),
            // Name
            Text(
              this.widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Rating
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: getRatingWidget(
                this.widget.averageRating,
                Colors.yellow.shade700,
              ),
            ),
            /*
            // Chat button
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlueAccent,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.chat_bubble),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            // Review heading
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            */
            Text(
              reviews.length.toString() + ' reviews',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: buildAllReviews(reviews),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

Widget getRatingWidget(double rating, Color _color) {
  List<Widget> widgets;
  widgets = List.generate(
    5,
    (index) => buildStar(index, rating, _color),
  );
  widgets.add(
    Text(
      '  ' + rating.toString(),
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15,
      ),
    ),
  );
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: widgets,
  );
}

Widget buildStar(int index, double rating, Color _color) {
  Icon icon;
  if (index >= rating) {
    icon = new Icon(
      Icons.star_border,
      color: _color,
    );
  } else if (index > rating - 1 && index < rating) {
    icon = new Icon(
      Icons.star_half,
      color: _color,
    );
  } else {
    icon = new Icon(
      Icons.star,
      color: _color,
    );
  }
  return icon;
}

Widget buildSingleReview(Review review) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getRatingWidget(review.rating, Colors.grey.shade700),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              review.date,
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        child: Text(review.reviewText),
      ),
    ],
  );
}

Widget buildAllReviews(List<Review> reviews) {
  return ListView.builder(
    itemCount: reviews.length,
    itemBuilder: (context, index) {
      return buildSingleReview(reviews[index]);
    },
  );
}

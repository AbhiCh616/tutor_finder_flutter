import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/utils/color.dart';

class TutorProfile extends StatelessWidget {
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
              'Randy Scott',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Rating
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: getRating(4.3),
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
          ],
        ),
      ),
    );
  }
}

Widget getRating(double rating) {
  List<Widget> widgets;
  widgets = List.generate(
    5,
    (index) => buildStar(index, rating),
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

Widget buildStar(int index, double rating) {
  Icon icon;
  if (index >= rating) {
    icon = new Icon(
      Icons.star_border,
      color: Colors.yellow.shade700,
    );
  } else if (index > rating - 1 && index < rating) {
    icon = new Icon(
      Icons.star_half,
      color: Colors.yellow.shade700,
    );
  } else {
    icon = new Icon(
      Icons.star,
      color: Colors.yellow.shade700,
    );
  }
  return icon;
}

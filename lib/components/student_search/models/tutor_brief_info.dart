import 'package:tutor_finder_flutter/components/tutor_profile/models/review.dart';

class TutorBriefInfo {
  final String name;
  final double rating;
  final List<String> subjects;
  final double charge;
  final String chargeDuration;
  final List<Review> reviews;

  TutorBriefInfo(this.name, this.rating, this.subjects, this.charge,
      this.chargeDuration, this.reviews);
}

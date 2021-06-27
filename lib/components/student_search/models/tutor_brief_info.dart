import 'package:tutor_finder_flutter/components/registration/utils/gender.dart';
import 'package:tutor_finder_flutter/components/student_search/models/subject_bundle.dart';
import 'package:tutor_finder_flutter/components/tutor_profile/models/review.dart';
import 'package:http/http.dart' as http;

class TutorBriefInfo {
  final int id;
  final String name;
  final String dob;
  final String gender;
  final List<SubjectBundle> subjectBundles;
  final double rating;
  final List<Review> reviews;

  TutorBriefInfo(this.id, this.name, this.dob, this.gender, this.subjectBundles,
      this.rating, this.reviews);

  factory TutorBriefInfo.fromJson(
    dynamic json,
    double rating,
    List<Review> reviews,
  ) {
    List<SubjectBundle> subjectBundles = [];

    json['subjects_bundles'].forEach((v) {
      subjectBundles.add(SubjectBundle.fromJson(v));
    });

    return TutorBriefInfo(
      json['id'],
      json['name'],
      json['dob'],
      json['gender'],
      subjectBundles,
      rating,
      reviews,
    );
  }
}

enum ChargeDuration { Mo, Yr, Hr }

class SubjectBundle {
  final double charge;
  final String chargeCycle;
  final List<Subject> subjects;

  SubjectBundle(this.charge, this.chargeCycle, this.subjects);

  factory SubjectBundle.fromJson(dynamic json) {
    List<Subject> subjects = [];
    json['subjects'].forEach((v) {
      subjects.add(Subject.fromJson(v));
    });
    return SubjectBundle(json['charge'], json['charge_cycle'], subjects);
  }
}

class Subject {
  final String subject;

  Subject(this.subject);

  factory Subject.fromJson(dynamic json) {
    return Subject(json['subject_name']);
  }
}

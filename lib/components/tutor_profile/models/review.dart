class Review {
  final double rating;
  final String date;
  final String reviewText;

  Review(this.rating, this.date, this.reviewText);

  factory Review.fromJson(dynamic json) {
    return Review(json['rating'], '2020-06-05', json['description']);
  }
}

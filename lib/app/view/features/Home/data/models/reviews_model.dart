import 'package:json_annotation/json_annotation.dart';
import 'package:learning/app/view/features/Home/domain/entities/review_entity.dart';
part 'reviews_model.g.dart';

DateTime dateTimeFromJson(dynamic json) {
  return json == null ? DateTime.now() : DateTime.parse(json as String);
}

@JsonSerializable()
class ReviewsModel {
  @JsonKey(name: 'rating', defaultValue: 0)
  final int rating;

  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;

  @JsonKey(name: 'date', fromJson: dateTimeFromJson)
  final DateTime date;

  @JsonKey(name: 'reviewerName', defaultValue: '')
  final String reviewerName;

  @JsonKey(name: 'reviewerEmail', defaultValue: '')
  final String reviewerEmail;

  ReviewsModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsModelToJson(this);

  ReviewEntity toDomain() => ReviewEntity(
    rating: rating,
    comment: comment,
    date: date,
    reviewerName: reviewerName,
    reviewerEmail: reviewerEmail,
  );
}

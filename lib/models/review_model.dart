// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Review {
  final String id;
  final String movieId;
  final String desciption;
  final bool spolier;
  final bool userReview;
  final List<String> comments;
  Review({
    required this.id,
    required this.movieId,
    required this.desciption,
    required this.spolier,
    required this.userReview,
    required this.comments,
  });

  Review copyWith({
    String? id,
    String? movieId,
    String? desciption,
    bool? spolier,
    bool? userReview,
    List<String>? comments,
  }) {
    return Review(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      desciption: desciption ?? this.desciption,
      spolier: spolier ?? this.spolier,
      userReview: userReview ?? this.userReview,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'movieId': movieId,
      'desciption': desciption,
      'spolier': spolier,
      'userReview': userReview,
      'comments': comments,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['_id'] ?? "",
      movieId: map['movieId'] as String,
      desciption: map['desciption'] as String,
      spolier: map['spolier'] as bool,
      userReview: map['userReview'] as bool,
      comments: List<String>.from(
        (map['comments'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(id: $id, movieId: $movieId, desciption: $desciption, spolier: $spolier, userReview: $userReview, comments: $comments)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.movieId == movieId &&
        other.desciption == desciption &&
        other.spolier == spolier &&
        other.userReview == userReview &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        movieId.hashCode ^
        desciption.hashCode ^
        spolier.hashCode ^
        userReview.hashCode ^
        comments.hashCode;
  }
}

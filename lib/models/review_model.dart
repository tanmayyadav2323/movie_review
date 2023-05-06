// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Review {
  final String id;
  final String title;
  final String movieId;
  final String desciption;
  final bool spolier;
  final String name;
  final String url;
  final String userId;
  final bool userReview;
  final List<String> comments;
  Review({
    required this.id,
    required this.title,
    required this.movieId,
    required this.desciption,
    required this.spolier,
    required this.name,
    required this.url,
    required this.userId,
    required this.userReview,
    required this.comments,
  });

  Review copyWith({
    String? id,
    String? title,
    String? movieId,
    String? desciption,
    bool? spolier,
    String? name,
    String? url,
    String? userId,
    bool? userReview,
    List<String>? comments,
  }) {
    return Review(
      id: id ?? this.id,
      title: title ?? this.title,
      movieId: movieId ?? this.movieId,
      desciption: desciption ?? this.desciption,
      spolier: spolier ?? this.spolier,
      name: name ?? this.name,
      url: url ?? this.url,
      userId: userId ?? this.userId,
      userReview: userReview ?? this.userReview,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'movieId': movieId,
      'desciption': desciption,
      'spolier': spolier,
      'name': name,
      'url': url,
      'userId': userId,
      'userReview': userReview,
      'comments': comments,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['_id'] ?? "",
      title: map['title'] ?? "",
      movieId: map['movieId'] ?? "",
      desciption: map['description'] ?? "",
      spolier: map['spoiler'] ?? false,
      name: map['name'] ?? "",
      url: map['url'] ?? "",
      userId: map['userId'] ?? "",
      userReview: map['userReview'] ?? false,
      comments: List<String>.from(
        (map['comments'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(id: $id, title: $title, movieId: $movieId, desciption: $desciption, spolier: $spolier, name: $name, url: $url, userId: $userId, userReview: $userReview, comments: $comments)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.movieId == movieId &&
        other.desciption == desciption &&
        other.spolier == spolier &&
        other.name == name &&
        other.url == url &&
        other.userId == userId &&
        other.userReview == userReview &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        movieId.hashCode ^
        desciption.hashCode ^
        spolier.hashCode ^
        name.hashCode ^
        url.hashCode ^
        userId.hashCode ^
        userReview.hashCode ^
        comments.hashCode;
  }
}

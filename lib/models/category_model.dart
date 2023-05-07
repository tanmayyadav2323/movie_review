// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String name;
  final List<dynamic> movies;
  final String title;
  final String image;
  Category({
    required this.id,
    required this.name,
    required this.movies,
    required this.title,
    required this.image,
  });

  Category copyWith({
    String? id,
    String? name,
    List<dynamic>? movies,
    String? title,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      movies: movies ?? this.movies,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'movies': movies,
      'title': title,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      movies: List<dynamic>.from((map['movies'] as List<dynamic>)),
      title: map['title'] ?? "",
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, movies: $movies, title: $title, image: $image)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.movies, movies) &&
        other.title == title &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        movies.hashCode ^
        title.hashCode ^
        image.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Comment {
  final String id;
  final String description;
  final List<String> likes;
  final List<String> dislikes;
  final List<Reply> replies;
  final String userId;
  final String name;
  final String imageUrl;
  Comment({
    required this.id,
    required this.description,
    required this.likes,
    required this.dislikes,
    required this.replies,
    required this.userId,
    required this.name,
    required this.imageUrl,
  });

  Comment copyWith({
    String? id,
    String? description,
    List<String>? likes,
    List<String>? dislikes,
    List<Reply>? replies,
    String? userId,
    String? name,
    String? imageUrl,
  }) {
    return Comment(
      id: id ?? this.id,
      description: description ?? this.description,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      replies: replies ?? this.replies,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'likes': likes,
      'dislikes': dislikes,
      'replies': replies.map((x) => x.toMap()).toList(),
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['_id'] ?? "",
      description: map['description'] ?? "",
      likes: List<String>.from((map['likes'] as List<dynamic>)),
      dislikes: List<String>.from((map['dislikes'] as List<dynamic>)),
      replies: List<Reply>.from(
        (map['replies']).map<Reply>(
          (x) => Reply.fromMap(x as Map<String, dynamic>),
        ),
      ),
      userId: map['userId'] ?? "",
      name: map['name'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(id: $id, description: $description, likes: $likes, dislikes: $dislikes, replies: $replies, userId: $userId, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        listEquals(other.likes, likes) &&
        listEquals(other.dislikes, dislikes) &&
        listEquals(other.replies, replies) &&
        other.userId == userId &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        likes.hashCode ^
        dislikes.hashCode ^
        replies.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        imageUrl.hashCode;
  }
}

class Reply {
  final String name;
  final String imageUrl;
  final String userId;
  final String desciption;
  Reply({
    required this.name,
    required this.imageUrl,
    required this.userId,
    required this.desciption,
  });

  Reply copyWith({
    String? name,
    String? imageUrl,
    String? userId,
    String? desciption,
  }) {
    return Reply(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      desciption: desciption ?? this.desciption,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'userId': userId,
      'desciption': desciption,
    };
  }

  factory Reply.fromMap(Map<String, dynamic> map) {
    return Reply(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      userId: map['userId'] as String,
      desciption: map['desciption'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reply.fromJson(String source) =>
      Reply.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reply(name: $name, imageUrl: $imageUrl, userId: $userId, desciption: $desciption)';
  }

  @override
  bool operator ==(covariant Reply other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageUrl == imageUrl &&
        other.userId == userId &&
        other.desciption == desciption;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        userId.hashCode ^
        desciption.hashCode;
  }
}

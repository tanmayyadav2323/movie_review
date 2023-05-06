// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String imageUrl;
  final String phone;
  final String token;
  final String description;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.phone,
    required this.token,
    required this.description,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
    String? phone,
    String? token,
    String? description,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
      'phone': phone,
      'token': token,
      'description': description,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      phone: map['phone'] ?? "",
      token: map['token'] ?? "",
      description: map['description'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, imageUrl: $imageUrl, phone: $phone, token: $token, description: $description)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.imageUrl == imageUrl &&
        other.phone == phone &&
        other.token == token &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        imageUrl.hashCode ^
        phone.hashCode ^
        token.hashCode ^
        description.hashCode;
  }
}

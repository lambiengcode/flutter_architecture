import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final String? username;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String accessToken;
  final String? avatar;
  final List<String>? gallery;

  User({
    this.username,
    this.fullName,
    this.phoneNumber,
    this.email,
    required this.accessToken,
    this.avatar,
    this.gallery,
  });

  User copyWith({
    String? username,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? accessToken,
    String? avatar,
    List<String>? gallery,
  }) {
    return User(
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      avatar: avatar ?? this.avatar,
      gallery: gallery ?? this.gallery,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'accessToken': accessToken,
      'avatar': avatar,
      'gallery': gallery,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      accessToken: map['accessToken'],
      avatar: map['avatar'],
      gallery: List<String>.from(map['gallery']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, fullName: $fullName, phoneNumber: $phoneNumber, email: $email, accessToken: $accessToken, avatar: $avatar, gallery: $gallery)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.accessToken == accessToken &&
        other.avatar == avatar &&
        listEquals(other.gallery, gallery);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        accessToken.hashCode ^
        avatar.hashCode ^
        gallery.hashCode;
  }
}

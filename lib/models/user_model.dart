import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.profilePicUrl,
    required this.bannerUrl,
    required this.uid,
    required this.isAuthenticated,
    required this.karma,
    required this.awards,
  });

  final String name;
  final String profilePicUrl;
  final String bannerUrl;
  final String uid;
  final bool isAuthenticated;
  final int karma;
  final List<String> awards;

  UserModel copyWith({
    String? name,
    String? profilePicUrl,
    String? bannerUrl,
    String? uid,
    bool? isAuthenticated,
    int? karma,
    List<String>? awards,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      karma: karma ?? this.karma,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePicUrl': profilePicUrl,
      'bannerUrl': bannerUrl,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'karma': karma,
      'awards': awards,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      bannerUrl: map['bannerUrl'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      karma: map['karma'] as int,
      awards: List<String>.from((map['awards'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) {
    return UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilePicUrl: $profilePicUrl, '
        'bannerUrl: $bannerUrl, uid: $uid, isAuthenticated: $isAuthenticated, '
        'karma: $karma, awards: $awards)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePicUrl == profilePicUrl &&
        other.bannerUrl == bannerUrl &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated &&
        other.karma == karma &&
        listEquals(other.awards, awards);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePicUrl.hashCode ^
        bannerUrl.hashCode ^
        uid.hashCode ^
        isAuthenticated.hashCode ^
        karma.hashCode ^
        awards.hashCode;
  }
}

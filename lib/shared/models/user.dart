import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final int recipeCount;
  final int followingCount;
  final int followersCount;
  final String photoUrl;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.recipeCount,
    required this.followingCount,
    required this.followersCount,
    required this.photoUrl,
  });

  String get fullName {
    return '$firstName $lastName';
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    int? recipeCount,
    int? followingCount,
    int? followersCount,
    String? photoUrl,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      recipeCount: recipeCount ?? this.recipeCount,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'recipeCount': recipeCount,
      'followingCount': followingCount,
      'followersCount': followersCount,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      recipeCount: json['recipeCount'] as int,
      followingCount: json['followingCount'] as int,
      followersCount: json['followersCount'] as int,
      photoUrl: '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      recipeCount,
      followingCount,
      followersCount,
    ];
  }
}

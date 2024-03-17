
class User {
  final String id;
  final String? firstName;
  final String? lastName;
  final String email;
  final int recipeCount;
  final int followingCount;
  final int followersCount;
  final String? photoUrl;

  const User({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.recipeCount = 0,
    this.followingCount = 0,
    this.followersCount = 0,
    this.photoUrl,
  });

  String get fullName {
    return '$firstName $lastName';
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    int? recipeCount,
    int? followingCount,
    int? followersCount,
    String? photoUrl,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      recipeCount: recipeCount ?? this.recipeCount,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}

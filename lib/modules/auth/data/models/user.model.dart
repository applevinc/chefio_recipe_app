import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    super.firstName,
    super.lastName,
    super.followersCount,
    super.followingCount,
    super.isEmailVerified,
    super.photoUrl,
    super.recipeCount,
    super.isFollowing,
  });

  static UserModel fromDataSource({
    required Map<String, dynamic> map,
    List<String>? followingUserIds,
  }) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      firstName: map['firstname'],
      lastName: map['lastname'],
      recipeCount: map['recipe_count'],
      followingCount: map['following_count'],
      followersCount: map['followers_count'],
      photoUrl: map['photo_url'],
      isEmailVerified: map['is_email_verified'],
      isFollowing: followingUserIds?.contains(map['id']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'recipe_count': recipeCount,
      'following_count': followingCount,
      'followers_count': followersCount,
      'photo_url': photoUrl,
      'is_email_verified': isEmailVerified,
    };
  }
}

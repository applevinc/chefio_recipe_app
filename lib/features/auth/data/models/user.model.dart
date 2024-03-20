import 'package:chefio_recipe_app/common/models/user.dart';

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
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'recipeCount': recipeCount,
      'followingCount': followingCount,
      'followersCount': followersCount,
      'photoUrl': photoUrl,
      'isEmailVerified': isEmailVerified,
    };
  }
}

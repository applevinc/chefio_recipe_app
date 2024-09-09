import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/user.model.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';

abstract class FirebaseUtils {
  static Future<List<String>> getLikedRecipeIds(User user) async {
    final userDoc = await usersCollection.doc(user.id).get();
    return List<String>.from(userDoc.data()?['liked_recipes'] ?? []);
  }

  static Future<List<String>> getFollowingUserIds() async {
    final userDoc = await usersCollection.doc(AppSession.authUser?.id).get();
    return List<String>.from(userDoc.data()?['following'] ?? []);
  }

  static Future<UserModel> getUser(String userId) async {
    final querySnapshot = await usersCollection.doc(userId).get();
    final data = querySnapshot.data();

    if (data == null) {
      throw Failure('User not found');
    }

    final followingUserIds = await getFollowingUserIds();
    
    return UserModel.fromDataSource(map: data, followingUserIds: followingUserIds);
  }
}

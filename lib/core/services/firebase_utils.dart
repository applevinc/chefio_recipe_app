import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/user.model.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

abstract class FirebaseUtils {
  static Future<List<String>> getLikedRecipeIds(User user) async {
    try {
      final userDoc = await usersCollection.doc(user.id).get();
      return List<String>.from(userDoc.data()?['liked_recipes'] ?? []);
    } catch (e, s) {
      logError(e, s,
          source: './lib/modules/recipe/data/data_sources/impls/recipe_list_data_source.dart');

      throw InternalFailure();
    }
  }

  static Future<List<String>> getFollowingUserIds() async {
    try {
      final userDoc = await usersCollection.doc(AppSession.authUser?.id).get();
      return List<String>.from(userDoc.data()?['following'] ?? []);
    } catch (e, s) {
      logError(e, s,
          source: './lib/modules/recipe/data/data_sources/impls/recipe_list_data_source.dart');

      throw InternalFailure();
    }
  }

  static Future<UserModel> getUser(String userId) async {
    final querySnapshot = await usersCollection.doc(userId).get();
    final data = querySnapshot.data();

    if (data == null) {
      throw Failure('User not found');
    }

    return UserModel.fromMap(data);
  }
}

import 'package:firebase_storage/firebase_storage.dart';

final profilePicturesStorage = FirebaseStorage.instance.ref().child('profile_pictures');

final recipeCoverPhotosStorage =
    FirebaseStorage.instance.ref().child('recipe_cover_photos');

final recipeCookingStepPhotosStorage =
    FirebaseStorage.instance.ref().child('recipe_cooking_step_photos');

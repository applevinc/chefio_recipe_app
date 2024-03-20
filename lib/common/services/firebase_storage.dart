import 'package:firebase_storage/firebase_storage.dart';

final profilePicturesStorage = FirebaseStorage.instance.ref().child('profile_pictures');

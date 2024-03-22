import 'package:cloud_firestore/cloud_firestore.dart';

final usersCollection = FirebaseFirestore.instance.collection('users');

final recipesCollection = FirebaseFirestore.instance.collection('recipes');

final likedRecipesCollection = FirebaseFirestore.instance.collection('liked_recipes');

final categoriesCollection = FirebaseFirestore.instance.collection('categories');

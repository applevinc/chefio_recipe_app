class Recipe {
  final String id;
  final Chef user;
  final String title;
  final String description;
  final int duration;
  final String coverPhotoUrl;
  final int likeCount;
  final List<String> ingredients;
  final List<CookingStep> steps;

  Recipe({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.duration,
    required this.coverPhotoUrl,
    required this.likeCount,
    required this.ingredients,
    required this.steps,
  });
}

class Chef {
  final String id;
  final String photoUrl;
  final String firstName;
  final String lastName;

  Chef({
    required this.id,
    required this.photoUrl,
    required this.firstName,
    required this.lastName,
  });

  String get fullName {
    return '$firstName $lastName';
  }
}

class CookingStep {
  final int step;
  final String description;
  final String photoUrl;

  CookingStep({
    required this.step,
    required this.description,
    required this.photoUrl,
  });
}

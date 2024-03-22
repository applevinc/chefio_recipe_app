import 'dart:io';

class CookingStepRequest {
  int step;
  String description;
  File? photo;

  CookingStepRequest({
    required this.step,
    required this.description,
    this.photo,
  });
}
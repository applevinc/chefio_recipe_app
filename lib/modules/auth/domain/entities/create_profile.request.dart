import 'dart:io';

class CreateProfileRequest {
  final String firstName;
  final String lastName;
  final String email;
  final File image;

  CreateProfileRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
  });
}

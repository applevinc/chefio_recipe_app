class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return 'Failure{message: $message}';
  }
}

class InternalFailure extends Failure {
  InternalFailure() : super('Something went wrong');
}

class EmailVerificationFailure extends Failure {
  EmailVerificationFailure() : super('Verification link has been sent to your email.');
}

class InCompleteProfileFailure extends Failure {
  InCompleteProfileFailure() : super('Please complete your profile');
}

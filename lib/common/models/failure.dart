class Failure {
  final String message;

  Failure(this.message);
}

class InternalFailure extends Failure {
  InternalFailure() : super('Something went wrong');
}

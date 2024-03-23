import 'package:clean_architecture/core/error/failure.dart';

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.cause,
  });
}

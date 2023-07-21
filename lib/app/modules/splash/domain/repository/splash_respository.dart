import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> getAuthorization();
}

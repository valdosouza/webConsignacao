import 'package:appweb/app/core/error/failures.dart';

import 'package:dartz/dartz.dart';

abstract class DrawertRepository {
  Future<Either<Failure, bool>> cashierIsOpen();
}

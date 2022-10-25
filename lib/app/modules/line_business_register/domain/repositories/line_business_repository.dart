import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:dartz/dartz.dart';

abstract class LineBusinessRepository {
  Future<Either<Failure, List<LineBusinessModel>>> getList(
      {required int institutionId});

  Future<Either<Failure, LineBusinessModel>> post(
      {required LineBusinessModel model});
  Future<Either<Failure, String>> put({required LineBusinessModel model});
  Future<Either<Failure, String>> delete({required int lineBusinessId});
}

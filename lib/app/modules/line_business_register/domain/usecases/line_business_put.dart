// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/line_business_repository.dart';

class LineBusinessPut extends UseCase<String, PutLineBusinessParams> {
  final LineBusinessRepository repository;
  LineBusinessPut({
    required this.repository,
  });

  @override
  Future<Either<Failure, String>> call(PutLineBusinessParams params) async {
    try {
      final response = await repository.put(model: params.businessModel);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PutLineBusinessParams {
  final LineBusinessModel businessModel;
  PutLineBusinessParams({
    required this.businessModel,
  });
}

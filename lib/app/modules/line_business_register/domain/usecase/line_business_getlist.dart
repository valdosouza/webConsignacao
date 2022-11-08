import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/line_business_repository.dart';
import 'package:dartz/dartz.dart';

class LineBusinessGetlist
    implements UseCase<List<LineBusinessModel>, ParamsLineBusinessGetList> {
  final LineBusinessRepository repository;

  LineBusinessGetlist({required this.repository});

  @override
  Future<Either<Failure, List<LineBusinessModel>>> call(
      ParamsLineBusinessGetList params) async {
    try {
      final list =
          await repository.getList(institutionId: params.tbInstitutionId);

      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsLineBusinessGetList {
  final int tbInstitutionId;

  const ParamsLineBusinessGetList({
    required this.tbInstitutionId,
  });
}

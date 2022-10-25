import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/line_business_repository.dart';

class LineBusinessDelete extends UseCase<String, DeleteLineBusinessParams> {
  final LineBusinessRepository repository;

  LineBusinessDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(DeleteLineBusinessParams params) async {
    try {
      final response =
          await repository.delete(lineBusinessId: params.idLineBusiness);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class DeleteLineBusinessParams {
  final int idLineBusiness;
  DeleteLineBusinessParams({
    required this.idLineBusiness,
  });
}

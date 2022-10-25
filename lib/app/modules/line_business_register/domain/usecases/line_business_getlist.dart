import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repositories/line_business_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LineBusinessGetlist implements UseCase<List<LineBusinessModel>, Params> {
  final LineBusinessRepository repository;

  LineBusinessGetlist({required this.repository});

  @override
  Future<Either<Failure, List<LineBusinessModel>>> call(Params params) async {
    try {
      final list =
          await repository.getList(institutionId: params.institutionId);

      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final int institutionId;

  const Params({
    required this.institutionId,
  });

  @override
  List<Object?> get props => [institutionId];
}

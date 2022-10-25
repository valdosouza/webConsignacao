import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/line_business_repository.dart';
import 'package:dartz/dartz.dart';

class LineBusinessPost
    implements UseCase<LineBusinessModel, PostLineBusinessParams> {
  final LineBusinessRepository repository;

  LineBusinessPost({required this.repository});

  @override
  Future<Either<Failure, LineBusinessModel>> call(
      PostLineBusinessParams params) async {
    try {
      final response = await repository.post(model: params.lineBusinessId);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PostLineBusinessParams {
  final LineBusinessModel lineBusinessId;

  const PostLineBusinessParams({
    required this.lineBusinessId,
  });
}

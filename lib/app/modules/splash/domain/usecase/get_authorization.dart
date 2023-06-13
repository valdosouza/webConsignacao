import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/splash/domain/repository/splash_respository.dart';
import 'package:dartz/dartz.dart';

class GetAuthorization implements UseCase<bool, ParamsAuthorization> {
  final SplashRepository repository;

  GetAuthorization({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ParamsAuthorization params) async {
    try {
      return await repository.getAuthorization();
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsAuthorization {
  ParamsAuthorization();
}

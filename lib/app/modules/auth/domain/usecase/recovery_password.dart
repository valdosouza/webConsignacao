import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RecoveryPassword
    implements UseCase<AuthRecoveryPasswordModel, ParamsRecovery> {
  final AuthRepository repository;

  RecoveryPassword({required this.repository});

  @override
  Future<Either<Failure, AuthRecoveryPasswordModel>> call(
      ParamsRecovery params) async {
    try {
      final recovery = await repository.recoveryPassword(
        email: params.email,
      );

      return recovery;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRecovery {
  final String email;

  const ParamsRecovery({
    required this.email,
  });
}

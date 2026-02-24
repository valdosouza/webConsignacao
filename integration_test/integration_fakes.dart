import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// Fake [AuthRepository] for integration tests (no real HTTP).
class IntegrationFakeAuthRepository implements AuthRepository {
  @override
  Future<Either<Failure, AuthModel>> loginEmail({
    required String username,
    required String password,
  }) async {
    return Right(
      AuthModel(
        auth: true,
        id: 1,
        tbInstitutionId: 1,
        username: username,
        password: '',
        jwt: 'fake-jwt',
        error: '',
      ),
    );
  }

  @override
  Future<Either<Failure, String>> changePassword({
    required dynamic model,
  }) async {
    return const Right('OK');
  }

  @override
  Future<Either<Failure, AuthRecoveryPasswordModel>> recoveryPassword({
    required String email,
  }) async {
    return Right(AuthRecoveryPasswordModel(tbUserId: 0, email: email));
  }
}

import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// Fake [AuthRepository] for integration tests and tests that need
/// deterministic login without real HTTP.
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({
    this.loginResult,
    this.changePasswordResult,
    this.recoveryPasswordResult,
  });

  Either<Failure, AuthModel>? loginResult;
  Either<Failure, String>? changePasswordResult;
  Either<Failure, AuthRecoveryPasswordModel>? recoveryPasswordResult;

  @override
  Future<Either<Failure, AuthModel>> loginEmail({
    required String username,
    required String password,
  }) async {
    if (loginResult != null) return loginResult!;
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
    if (changePasswordResult != null) return changePasswordResult!;
    return const Right('OK');
  }

  @override
  Future<Either<Failure, AuthRecoveryPasswordModel>> recoveryPassword({
    required String email,
  }) async {
    if (recoveryPasswordResult != null) return recoveryPasswordResult!;
    return Right(AuthRecoveryPasswordModel(tbUserId: 0, email: email));
  }
}

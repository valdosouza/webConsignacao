import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> loginEmail({
    required String username,
    required String password,
  });
  Future<Either<Failure, String>> changePassword({
    required AuthChangePasswordModel model,
  });
  Future<Either<Failure, String>> recoveryPassword({
    required String email,
  });
}

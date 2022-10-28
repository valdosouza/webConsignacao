import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  //final NetworkInfo networkinfo;
  AuthRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, AuthModel>> loginEmail(
      {required String username, required String password}) async {
    try {
      final logemail = await datasource.getAuthentication(
          username: username,
          password: md5.convert(utf8.encode(password)).toString());

      return Right(logemail);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
      {required AuthChangePasswordModel model}) async {
    try {
      final change = await datasource.changePassword(model: model);
      return Right(change);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthRecoveryPasswordModel>> recoveryPassword(
      {required String email}) async {
    try {
      final recovery = await datasource.recoveryPassword(email: email);
      return Right(recovery);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

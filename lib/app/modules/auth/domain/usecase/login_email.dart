import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginEmail implements UseCase<AuthModel, Params> {
  final AuthRepository repository;

  LoginEmail({required this.repository});

  @override
  Future<Either<Failure, AuthModel>> call(Params params) async {
    try {
      final logemail = await repository.loginEmail(
          username: params.username, password: params.password);

      return logemail;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  const Params({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

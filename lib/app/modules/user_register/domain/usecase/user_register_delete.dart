import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/user_register/domain/repository/user_register_respository.dart';
import 'package:dartz/dartz.dart';

class UserRegisterDelete implements UseCase<String, ParamsDeleteUser> {
  final UserRegisterRepository repository;

  UserRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsDeleteUser params) async {
    try {
      final user = await repository.editUser(userId: params.id);
      return user;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDeleteUser {
  final int id;
  const ParamsDeleteUser({required this.id});
}

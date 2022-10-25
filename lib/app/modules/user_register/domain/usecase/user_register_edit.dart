import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/user_register/domain/repository/user_register_respository.dart';
import 'package:dartz/dartz.dart';

class UserRegisterEdit implements UseCase<String, ParamsEditUser> {
  final UserRegisterRepository repository;

  UserRegisterEdit({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsEditUser params) async {
    try {
      final user = await repository.editUser(userId: params.id);
      return user;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsEditUser {
  final int id;
  const ParamsEditUser({required this.id});
}

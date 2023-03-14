import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/repository/user_register_respository.dart';
import 'package:dartz/dartz.dart';

class UserRegisterPut implements UseCase<UserRegisterModel, ParamsEditUser> {
  final UserRegisterRepository repository;

  UserRegisterPut({required this.repository});

  @override
  Future<Either<Failure, UserRegisterModel>> call(ParamsEditUser params) async {
    try {
      final user = await repository.put(model: params.model);
      return user;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsEditUser {
  final UserRegisterModel model;
  const ParamsEditUser({required this.model});
}

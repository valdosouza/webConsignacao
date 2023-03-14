import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/repository/user_register_respository.dart';
import 'package:dartz/dartz.dart';

class UserRegisterPost implements UseCase<UserRegisterModel, ParamsAddUser> {
  final UserRegisterRepository repository;

  UserRegisterPost({required this.repository});

  @override
  Future<Either<Failure, UserRegisterModel>> call(ParamsAddUser params) async {
    try {
      final user = await repository.post(model: params.user);
      return user;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsAddUser {
  final UserRegisterModel user;
  const ParamsAddUser({required this.user});
}

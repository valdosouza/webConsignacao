import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/repository/user_register_respository.dart';
import 'package:dartz/dartz.dart';

class UserRegisterGetlist
    implements UseCase<List<UserRegisterModel>, ParamsGetUser> {
  final UserRegisterRepository repository;

  UserRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<UserRegisterModel>>> call(
      ParamsGetUser params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetUser {
  int id;
  ParamsGetUser({required this.id});
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/user_register/data/datasource/user_register_datasource.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/repository/user_register_respository.dart';
import 'package:dartz/dartz.dart';

class UserRegisterRepositoryImpl implements UserRegisterRepository {
  final UserRegisterDataSource datasource;
  //final NetworkInfo networkinfo;
  UserRegisterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<UserRegisterModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserRegisterModel>> addUser(
      {required UserRegisterModel model}) async {
    try {
      final result = await datasource.addUser(user: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser({required int userId}) async {
    try {
      final result = await datasource.deleteUser(id: userId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

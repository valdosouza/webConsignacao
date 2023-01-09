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
  Future<Either<Failure, UserRegisterModel>> post(
      {required UserRegisterModel model}) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int userId}) async {
    try {
      final result = await datasource.delete(id: userId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserRegisterModel>> put(
      {required UserRegisterModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

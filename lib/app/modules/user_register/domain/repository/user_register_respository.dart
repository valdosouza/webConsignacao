import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRegisterRepository {
  Future<Either<Failure, List<UserRegisterModel>>> getList({required int id});
  Future<Either<Failure, UserRegisterModel>> addUser(
      {required UserRegisterModel model});
  Future<Either<Failure, String>> deleteUser({required int userId});
  Future<Either<Failure, String>> editUser({required int userId});
}

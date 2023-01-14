import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRegisterRepository {
  Future<Either<Failure, List<UserRegisterModel>>> getList();
  Future<Either<Failure, UserRegisterModel>> post(
      {required UserRegisterModel model});
  Future<Either<Failure, String>> delete({required int userId});
  Future<Either<Failure, UserRegisterModel>> put(
      {required UserRegisterModel model});
}

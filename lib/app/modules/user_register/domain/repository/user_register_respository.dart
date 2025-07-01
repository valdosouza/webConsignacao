import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';
import 'package:dartz/dartz.dart';

abstract class UserRegisterRepository {
  Future<Either<Failure, List<UserRegisterModel>>> getList(
      {required ParamsGetUser params});
  Future<Either<Failure, UserRegisterModel>> post(
      {required UserRegisterModel model});
  Future<Either<Failure, String>> delete({required int tbUserId});
  Future<Either<Failure, UserRegisterModel>> put(
      {required UserRegisterModel model});
}

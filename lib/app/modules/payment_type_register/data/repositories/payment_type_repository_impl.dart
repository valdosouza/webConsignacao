import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/payment_type_register/data/datasource/remote/ownapi/payment_type_datasource.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypeRepositoryImpl implements PaymentTypeRepository {
  final PaymentTypeDatasource datasource;
  //final NetworkInfo networkinfo;
  PaymentTypeRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<PaymentTypeModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PaymentTypeModel>> post(
      {required PaymentTypeModel model}) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int paymentTypeId}) async {
    try {
      final result = await datasource.delete(id: paymentTypeId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> put({required PaymentTypeModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

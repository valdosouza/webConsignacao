import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:appweb/app/modules/payment_type_register/data/datasource/remote/ownapi/payment_type_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../model/payment_model.dart';

class PaymentTypeRepositoryImpl implements PaymentTypeRepository {
  final PaymentTypeDataSource paymentTypeDataSource;

  PaymentTypeRepositoryImpl({required this.paymentTypeDataSource});

  @override
  Future<Either<Failure, String>> addPaymentType(
      {required PaymentTypeModel paymentTypeModel}) async {
    try {
      final result = await paymentTypeDataSource.postPaymentType(
          paymentModel: paymentTypeModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PaymentTypeModel>>> getList(
      {required int institutionId}) async {
    try {
      final result = await paymentTypeDataSource.getlist(idInstitution: "1");
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePaymentType(
      {required int paymentId}) async {
    try {
      final result =
          await paymentTypeDataSource.deletePaymentType(paymentId: paymentId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> putPaymentType(
      {required PaymentTypeModel paymentTypeModel}) async {
    try {
      final result = await paymentTypeDataSource.putPaymentType(
          paymentTypeModel: paymentTypeModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

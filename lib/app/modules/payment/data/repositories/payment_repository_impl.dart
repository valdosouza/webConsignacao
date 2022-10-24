import 'package:appweb/app/modules/payment/domain/repositories/payment_repository.dart';
import 'package:appweb/app/modules/payment/data/datasource/remote/ownapi/payment_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../model/payment_model.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource paymentDataSource;

  PaymentRepositoryImpl({required this.paymentDataSource});

  @override
  Future<Either<Failure, String>> addPayment(
      {required PaymentModel paymentModel}) async {
    try {
      final result =
          await paymentDataSource.postPayment(paymentModel: paymentModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PaymentModel>>> getList(
      {required int institutionId}) async {
    try {
      final result = await paymentDataSource.getlist(idInstitution: "1");
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePayment(
      {required int paymentId}) async {
    try {
      final result =
          await paymentDataSource.deletePayment(paymentId: paymentId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> putPayment(
      {required PaymentModel paymentModel}) async {
    try {
      final result =
          await paymentDataSource.putPayment(paymentModel: paymentModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

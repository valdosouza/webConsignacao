import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentTypeRegisterRepository {
  Future<Either<Failure, List<PaymentTypeModel>>> getList(
      {required int institutionId});
  Future<Either<Failure, PaymentTypeModel>> post(
      {required PaymentTypeModel model});
  Future<Either<Failure, PaymentTypeModel>> put(
      {required PaymentTypeModel model});
  Future<Either<Failure, String>> delete({required int id});
}

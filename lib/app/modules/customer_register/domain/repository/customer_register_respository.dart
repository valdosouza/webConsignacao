import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRegisterRepository {
  Future<Either<Failure, List<CustomerMainModel>>> getList({required int id});
}

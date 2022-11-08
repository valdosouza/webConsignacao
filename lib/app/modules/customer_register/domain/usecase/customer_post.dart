import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterPost
    implements UseCase<CustomerMainModel, ParamsPostCustomer> {
  final CustomerRegisterRepository repository;

  CustomerRegisterPost({required this.repository});

  @override
  Future<Either<Failure, CustomerMainModel>> call(
      ParamsPostCustomer params) async {
    try {
      final model = await repository.post(customer: params.customer);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostCustomer {
  CustomerMainModel customer;
  ParamsPostCustomer({required this.customer});
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterGet
    implements UseCase<CustomerMainModel, ParamsGetCustomer> {
  final CustomerRegisterRepository repository;

  CustomerRegisterGet({required this.repository});

  @override
  Future<Either<Failure, CustomerMainModel>> call(
      ParamsGetCustomer params) async {
    try {
      final model = await repository.get(id: params.id);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCustomer {
  int id;

  ParamsGetCustomer({required this.id});
}

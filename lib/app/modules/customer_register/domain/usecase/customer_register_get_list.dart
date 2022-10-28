import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterGetlist
    implements UseCase<List<CustomerMainModel>, ParamsGetCustomer> {
  final CustomerRegisterRepository repository;

  CustomerRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CustomerMainModel>>> call(
      ParamsGetCustomer params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCustomer {
  int id;
  ParamsGetCustomer({required this.id});
}

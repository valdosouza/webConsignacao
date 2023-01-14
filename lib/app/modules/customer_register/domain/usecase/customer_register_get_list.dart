import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterGetlist
    implements UseCase<List<CustomerListModel>, ParamsGetListCustomer> {
  final CustomerRegisterRepository repository;

  CustomerRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CustomerListModel>>> call(
      ParamsGetListCustomer params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListCustomer {
  ParamsGetListCustomer();
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_salesman_model.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterGetSalesmans
    implements UseCase<List<CustomerSalesmanModel>, ParamsGetListSalesman> {
  final CustomerRegisterRepository repository;

  CustomerRegisterGetSalesmans({required this.repository});

  @override
  Future<Either<Failure, List<CustomerSalesmanModel>>> call(
      ParamsGetListSalesman params) async {
    try {
      final list = await repository.getSalesmans(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListSalesman {
  int id;
  ParamsGetListSalesman({required this.id});
}

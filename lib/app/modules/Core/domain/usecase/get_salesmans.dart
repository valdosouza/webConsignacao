import 'package:appweb/app/modules/Core/domain/repository/get_salesman_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:dartz/dartz.dart';

class GetSalesmans
    implements UseCase<List<SalesmanListModel>, ParamsSalesmanListGet> {
  final GetSalesmanRepository repository;

  GetSalesmans({required this.repository});

  @override
  Future<Either<Failure, List<SalesmanListModel>>> call(
      ParamsSalesmanListGet params) async {
    try {
      final list = await repository.getSalesmans(id: params.tbInstitutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSalesmanListGet {
  int tbInstitutionId;
  ParamsSalesmanListGet({required this.tbInstitutionId});
}

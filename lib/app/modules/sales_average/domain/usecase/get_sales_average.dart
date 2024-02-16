import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_average/domain/repository/respository.dart';

class GetSalesAverage
    implements UseCase<List<SalesAverageModel>, ParamsGetSales> {
  final Repository repository;

  GetSalesAverage({required this.repository});

  @override
  Future<Either<Failure, List<SalesAverageModel>>> call(
      ParamsGetSales params) async {
    try {
      final model = await repository.getSalesAverage(params);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetSales {
  int tbRegionId;
  String dateIinicial;
  String dataFinal;
  int page;
  ParamsGetSales({
    required this.tbRegionId,
    required this.dateIinicial,
    required this.dataFinal,
    required this.page,
  });
}

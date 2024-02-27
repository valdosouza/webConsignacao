import 'package:appweb/app/core/shared/utils/custom_date.dart';
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
  int tbInstitutionId;
  int tbRegionId;
  String dateInitial;
  String dateFinal;

  ParamsGetSales({
    required this.tbInstitutionId,
    required this.tbRegionId,
    required this.dateInitial,
    required this.dateFinal,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_region_id'] = tbRegionId;
    data['date_initial'] = CustomDate.formatDateOut(dateInitial);
    data['date_final'] = CustomDate.formatDateOut(dateFinal);
    return data;
  }
}

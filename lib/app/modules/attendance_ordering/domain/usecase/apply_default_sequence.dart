import 'package:appweb/app/modules/attendance_ordering/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class ApplytDefaultSequence
    implements UseCase<void, ParamsApplyDefaultSequence> {
  final Repository repository;

  ApplytDefaultSequence({required this.repository});

  @override
  Future<Either<Failure, void>> call(ParamsApplyDefaultSequence params) async {
    try {
      final list = await repository.applyDefaultSequence(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsApplyDefaultSequence {
  int tbInstitutionId;
  int tbSalesRouteId;
  int tbRegionId;
  ParamsApplyDefaultSequence({
    required this.tbInstitutionId,
    required this.tbSalesRouteId,
    required this.tbRegionId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_sales_route_id'] = tbSalesRouteId;
    data['tb_region_id'] = tbRegionId;
    return data;
  }
}

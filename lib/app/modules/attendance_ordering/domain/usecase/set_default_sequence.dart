import 'package:appweb/app/modules/attendance_ordering/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class SetDefaultSequence implements UseCase<void, ParamsDefaultSequence> {
  final Repository repository;

  SetDefaultSequence({required this.repository});

  @override
  Future<Either<Failure, void>> call(ParamsDefaultSequence params) async {
    try {
      final list = await repository.setDefaultSequence(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDefaultSequence {
  int tbInstitutionId;
  int tbCustomerId;
  int tbSalesRouteId;
  int tbRegionId;
  int defaultSeq;
  ParamsDefaultSequence({
    required this.tbInstitutionId,
    required this.tbSalesRouteId,
    required this.tbRegionId,
    required this.tbCustomerId,
    required this.defaultSeq,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_customer_id'] = tbCustomerId;
    data['tb_sales_route_id'] = tbSalesRouteId;
    data['default_seq'] = defaultSeq;
    return data;
  }
}

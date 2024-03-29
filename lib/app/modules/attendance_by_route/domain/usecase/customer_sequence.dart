import 'package:dartz/dartz.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';

class CustomerSequence implements UseCase<void, ParamsSequenceCustomer> {
  final CustomerRepository repository;

  CustomerSequence({required this.repository});

  @override
  Future<Either<Failure, void>> call(ParamsSequenceCustomer params) async {
    try {
      final list = await repository.sequence(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSequenceCustomer {
  int tbInstitutionId;
  int tbCustomerId;
  int tbSalesRouteId;
  int tbRegionId;
  int sequence;
  int defaultSeq;

  ParamsSequenceCustomer({
    required this.tbInstitutionId,
    required this.tbSalesRouteId,
    required this.tbRegionId,
    required this.tbCustomerId,
    required this.sequence,
    required this.defaultSeq,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_customer_id'] = tbCustomerId;
    data['tb_sales_route_id'] = tbSalesRouteId;
    data['tb_region_id'] = tbRegionId;
    data['sequence'] = sequence;
    data['default_seq'] = defaultSeq;
    return data;
  }
}

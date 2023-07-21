import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';

class CustomerSetTurnBack implements UseCase<String, ParamsSetTurnBack> {
  final CustomerRepository repository;

  CustomerSetTurnBack({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsSetTurnBack params) async {
    try {
      final result = await repository.setTurnBack(params: params);
      return result;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSetTurnBack {
  int tbInstitutionId;
  int tbSalesRouteId;
  int tbCustomerId;
  String turnBack;

  ParamsSetTurnBack({
    required this.tbInstitutionId,
    required this.tbSalesRouteId,
    required this.tbCustomerId,
    required this.turnBack,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_sales_route_id'] = tbSalesRouteId;
    data['tb_customer_id'] = tbCustomerId;
    data['turn_back'] = turnBack;
    return data;
  }
}

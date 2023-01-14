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
      final list = await repository.sequence(
          tbSalesRouteId: params.tbSalesRouteId,
          tbCustomerId: params.tbCustomerId,
          sequence: params.sequence);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSequenceCustomer {
  int tbSalesRouteId;
  int tbCustomerId;
  int sequence;
  ParamsSequenceCustomer({
    required this.tbSalesRouteId,
    required this.tbCustomerId,
    required this.sequence,
  });
}

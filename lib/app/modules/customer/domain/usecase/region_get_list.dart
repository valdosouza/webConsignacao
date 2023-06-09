import 'package:dartz/dartz.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/customer/domain/repository/customer_respository.dart';

class RegionGetlist
    implements UseCase<List<RegionRegisterModel>, ParamsRegionGetList> {
  final CustomerRepository repository;

  RegionGetlist({required this.repository});

  @override
  Future<Either<Failure, List<RegionRegisterModel>>> call(
      ParamsRegionGetList params) async {
    try {
      final list = await repository.getRegionList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsRegionGetList {
  ParamsRegionGetList();
}

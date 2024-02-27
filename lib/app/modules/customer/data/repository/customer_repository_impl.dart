import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/customer/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/customer/domain/repository/customer_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource datasource;

  CustomerRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<RegionModel>>> getRegionList() async {
    try {
      final list = await datasource.getlistRegion();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

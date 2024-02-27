import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/customer_register/data/datasource/get_region_by_salesman_datasource.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/get_region_by_saleman_repository.dart';
import 'package:dartz/dartz.dart';

class GetRegionBySalesmanRepositoryImpl
    implements GetRegionBySalesmanRepository {
  final GetRegionBySalesmanDatasource datasource;

  GetRegionBySalesmanRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<RegionModel>>> getList() async {
    try {
      final response = await datasource.getList();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

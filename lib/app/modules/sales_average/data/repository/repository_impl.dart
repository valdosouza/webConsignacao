import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_average/data/datasource/datasource.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';
import 'package:appweb/app/modules/sales_average/domain/repository/respository.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final DataSource datasource;

  RepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<SalesAverageModel>>> getSalesAverage(
      ParamsGetSales params) async {
    try {
      final model = await datasource.getSalesAverage(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RegionModel>>> getRegion() async {
    try {
      final model = await datasource.getRegion();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

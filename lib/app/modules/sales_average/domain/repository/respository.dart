import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_average/data/model/region_model.dart';
import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<SalesAverageModel>>> getSalesAverage(
      ParamsGetSales params);

  Future<Either<Failure, List<RegionModel>>> getRegion();
}

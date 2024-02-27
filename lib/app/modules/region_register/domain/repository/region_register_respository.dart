import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegionRegisterRepository {
  Future<Either<Failure, List<RegionModel>>> getList();
  Future<Either<Failure, RegionModel>> post({required RegionModel model});
  Future<Either<Failure, RegionModel>> put({required RegionModel model});
  Future<Either<Failure, String>> delete({required int id});
}

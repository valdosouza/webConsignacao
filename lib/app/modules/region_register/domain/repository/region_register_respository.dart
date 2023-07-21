import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegionRegisterRepository {
  Future<Either<Failure, List<RegionRegisterModel>>> getList();
  Future<Either<Failure, RegionRegisterModel>> post(
      {required RegionRegisterModel model});
  Future<Either<Failure, RegionRegisterModel>> put(
      {required RegionRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
}

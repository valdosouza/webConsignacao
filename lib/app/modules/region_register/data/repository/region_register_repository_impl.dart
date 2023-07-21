import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/region_register/data/datasource/region_register_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/region_register/domain/repository/region_register_respository.dart';
import 'package:dartz/dartz.dart';

class RegionRegisterRepositoryImpl implements RegionRegisterRepository {
  final RegionRegisterDataSource datasource;

  RegionRegisterRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    try {
      final list = await datasource.delete(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RegionRegisterModel>> put(
      {required RegionRegisterModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RegionRegisterModel>>> getList() async {
    try {
      final list = await datasource.getlist();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RegionRegisterModel>> post(
      {required RegionRegisterModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/price_list_register/data/datasource/price_list_register_datasource.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRepositoryImpl implements PriceListRegisterRepository {
  final PriceListRegisterDataSource datasource;

  PriceListRepositoryImpl({required this.datasource});
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
  Future<Either<Failure, PriceListRegisterModel>> put(
      {required PriceListRegisterModel priceModel}) async {
    try {
      final list = await datasource.put(priceModel: priceModel);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PriceListRegisterModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PriceListRegisterModel>> post(
      {required PriceListRegisterModel priceModel}) async {
    try {
      final list = await datasource.post(priceModel: priceModel);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

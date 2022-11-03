import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class PriceListRegisterRepository {
  Future<Either<Failure, List<PriceListRegisterModel>>> getList(
      {required int id});
  Future<Either<Failure, PriceListRegisterModel>> post(
      {required PriceListRegisterModel priceModel});
  Future<Either<Failure, PriceListRegisterModel>> put(
      {required PriceListRegisterModel priceModel});
  Future<Either<Failure, String>> delete({required int id});
}

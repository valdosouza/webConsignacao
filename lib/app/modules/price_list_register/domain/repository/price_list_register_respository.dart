import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class PriceListRegisterRepository {
  Future<Either<Failure, List<PriceListModel>>> getList({required int id});
  Future<Either<Failure, PriceListModel>> post({required PriceListModel model});
  Future<Either<Failure, PriceListModel>> put({required PriceListModel model});
  Future<Either<Failure, String>> delete({required int id});
}

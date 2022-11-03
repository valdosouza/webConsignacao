import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRegisterEdit
    implements UseCase<PriceListRegisterModel, ParamsPriceListEdit> {
  final PriceListRegisterRepository repository;

  PriceListRegisterEdit({required this.repository});

  @override
  Future<Either<Failure, PriceListRegisterModel>> call(
      ParamsPriceListEdit params) async {
    try {
      final list = await repository.put(priceModel: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPriceListEdit {
  PriceListRegisterModel model;
  ParamsPriceListEdit({required this.model});
}

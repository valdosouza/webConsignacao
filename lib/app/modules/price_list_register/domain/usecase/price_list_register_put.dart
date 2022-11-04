import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRegisterPut
    implements UseCase<PriceListModel, ParamsPriceListPut> {
  final PriceListRegisterRepository repository;

  PriceListRegisterPut({required this.repository});

  @override
  Future<Either<Failure, PriceListModel>> call(
      ParamsPriceListPut params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPriceListPut {
  PriceListModel model;
  ParamsPriceListPut({required this.model});
}

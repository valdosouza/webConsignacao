import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRegisterGetlist
    implements UseCase<List<PriceListModel>, ParamsPriceListGet> {
  final PriceListRegisterRepository repository;

  PriceListRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<PriceListModel>>> call(
      ParamsPriceListGet params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPriceListGet {
  ParamsPriceListGet();
}

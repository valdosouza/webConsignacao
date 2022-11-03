import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRegisterGetlist
    implements UseCase<List<PriceListRegisterModel>, ParamsPriceListGet> {
  final PriceListRegisterRepository repository;

  PriceListRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<PriceListRegisterModel>>> call(
      ParamsPriceListGet params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPriceListGet {
  int id;
  ParamsPriceListGet({required this.id});
}

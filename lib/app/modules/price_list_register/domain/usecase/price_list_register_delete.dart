import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRegisterDelete
    implements UseCase<String, ParamsPriceListDelete> {
  final PriceListRegisterRepository repository;

  PriceListRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsPriceListDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPriceListDelete {
  int id;
  ParamsPriceListDelete({required this.id});
}

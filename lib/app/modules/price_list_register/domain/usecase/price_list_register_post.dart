import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/repository/price_list_register_respository.dart';
import 'package:dartz/dartz.dart';

class PriceListRegisterPost
    implements UseCase<PriceListModel, ParamsPriceListPost> {
  final PriceListRegisterRepository repository;

  PriceListRegisterPost({required this.repository});

  @override
  Future<Either<Failure, PriceListModel>> call(
      ParamsPriceListPost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPriceListPost {
  PriceListModel model;
  ParamsPriceListPost({required this.model});
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductGetlist
    implements UseCase<List<ProductListModel>, ParamsGetlistProduct> {
  final OrderBonusRegisterRepository repository;

  ProductGetlist({required this.repository});

  @override
  Future<Either<Failure, List<ProductListModel>>> call(
      ParamsGetlistProduct params) async {
    try {
      final list = await repository.getListProducts();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistProduct {
  ParamsGetlistProduct();
}

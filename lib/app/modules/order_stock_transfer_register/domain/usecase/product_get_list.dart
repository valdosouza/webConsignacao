import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/params_get_list_product_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductGetlist
    implements UseCase<List<ProductListModel>, ParamsGetlistProductModel> {
  final OrderStockTransferRegisterRepository repository;

  ProductGetlist({required this.repository});

  @override
  Future<Either<Failure, List<ProductListModel>>> call(
      ParamsGetlistProductModel params) async {
    try {
      final list = await repository.getListProducts(params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

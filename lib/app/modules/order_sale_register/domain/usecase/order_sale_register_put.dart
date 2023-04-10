import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterPut
    implements UseCase<OrderSaleListModel, ParamsPutOrderSaleRegister> {
  final OrderSaleRegisterRepository repository;

  OrderSaleRegisterPut({required this.repository});

  @override
  Future<Either<Failure, OrderSaleListModel>> call(
      ParamsPutOrderSaleRegister params) async {
    try {
      final model = await repository.put(model: params.model);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPutOrderSaleRegister {
  OrderSaleMainModel model;
  ParamsPutOrderSaleRegister({required this.model});
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleMainGet
    implements UseCase<OrderSaleMainModel, ParamsGetOrderSaleRegister> {
  final OrderSaleRegisterRepository repository;

  OrderSaleMainGet({required this.repository});

  @override
  Future<Either<Failure, OrderSaleMainModel>> call(
      ParamsGetOrderSaleRegister params) async {
    try {
      final list = await repository.get(orderId: params.orderid);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderSaleRegister {
  int orderid;

  ParamsGetOrderSaleRegister({required this.orderid});
}

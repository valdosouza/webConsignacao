import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterPost
    implements UseCase<OrderSaleListModel, ParamsPostOrderSaleRegister> {
  final OrderSaleRegisterRepository repository;

  OrderSaleRegisterPost({required this.repository});

  @override
  Future<Either<Failure, OrderSaleListModel>> call(
      ParamsPostOrderSaleRegister params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostOrderSaleRegister {
  OrderSaleMainModel model;
  ParamsPostOrderSaleRegister({required this.model});
}

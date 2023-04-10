import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterGetlist
    implements
        UseCase<List<OrderSaleListModel>, ParamsGetlistOrderSaleRegister> {
  final OrderSaleRegisterRepository repository;

  OrderSaleRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderSaleListModel>>> call(
      ParamsGetlistOrderSaleRegister params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistOrderSaleRegister {
  int id;
  ParamsGetlistOrderSaleRegister({required this.id});
}

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class OrderSaleRegisterDelete
    implements UseCase<String, ParamsDeleteOrderSaleRegister> {
  final OrderSaleRegisterRepository repository;

  OrderSaleRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsDeleteOrderSaleRegister params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDeleteOrderSaleRegister {
  int id;
  ParamsDeleteOrderSaleRegister({required this.id});
}

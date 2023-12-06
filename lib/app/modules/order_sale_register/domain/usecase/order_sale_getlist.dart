import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleGetlist
    implements UseCase<List<OrderSaleListModel>, ParamsOrderSaleList> {
  final OrderSaleRegisterRepository repository;

  OrderSaleGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderSaleListModel>>> call(
      ParamsOrderSaleList params) async {
    try {
      final list = await repository.getlist(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderSaleList {
  int tbInstitutionId;
  int page;
  int number;
  int tbSalesmanId;
  int tbCustomerId;
  String nickTrade;
  ParamsOrderSaleList({
    required this.tbInstitutionId,
    required this.page,
    required this.tbSalesmanId,
    required this.number,
    required this.tbCustomerId,
    required this.nickTrade,
  });
  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['page'] = page;
    data['number'] = number;
    data['tb_salesman_id'] = tbSalesmanId;
    data['tb_customer_id'] = tbCustomerId;
    data['nick_trade'] = nickTrade;
    return data;
  }
}

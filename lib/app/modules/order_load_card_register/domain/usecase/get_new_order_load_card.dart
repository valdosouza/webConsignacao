import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';

class GetNewOrderLoadCard
    implements UseCase<OrderLoadCardMainModel, ParamsGetNewOrderLoadCard> {
  final OrderLoadCardRegisterRepository repository;

  GetNewOrderLoadCard({required this.repository});
  @override
  Future<Either<Failure, OrderLoadCardMainModel>> call(
      ParamsGetNewOrderLoadCard params) async {
    return await repository.getNewOrderLoadCard(params: params);
  }
}

class ParamsGetNewOrderLoadCard {
  int tbSalesmanId;
  String dtRecord;
  ParamsGetNewOrderLoadCard({
    required this.tbSalesmanId,
    required this.dtRecord,
  });
}

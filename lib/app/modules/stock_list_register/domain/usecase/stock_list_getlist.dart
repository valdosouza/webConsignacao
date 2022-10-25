import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StockListGetlist implements UseCase<List<StockListModel>, Params> {
  final StockListRepository repository;

  StockListGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockListModel>>> call(Params params) async {
    try {
      final list =
          await repository.getList(institutionId: params.institutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final int institutionId;

  const Params({
    required this.institutionId,
  });

  @override
  List<Object?> get props => [institutionId];
}

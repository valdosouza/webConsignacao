import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:appweb/app/modules/home/data/datassource/home_datasource.dart';
import 'package:appweb/app/modules/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;
  HomeRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<HomeSalesPaymentTypeModel>>> getFinancialClosed(
      {required String initialDate,
      required String finalDate,
      required String terminal}) async {
    try {
      final result = await datasource.getFinancialClosed(
        initialDate: initialDate,
        finalDate: finalDate,
        terminal: terminal,
      );

      return Right(result);
    } on Exception {
      return Left(throw UnimplementedError());
    }
  }
}

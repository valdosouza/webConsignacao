import 'package:appweb/app/modules/Core/data/datasource/get_salesman_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_salesman_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetSalesmanRepositoryImpl implements GetSalesmanRepository {
  final GetSalesmanDatasource datasource;

  GetSalesmanRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<SalesmanListModel>>> getSalesman() async {
    try {
      final response = await datasource.getSalesman();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

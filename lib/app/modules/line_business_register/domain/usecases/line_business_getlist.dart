// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';

import '../../data/models/line_business_model.dart';
import '../repositories/line_business_repository.dart';

class LineBusinessGetlist
    extends UseCase<List<LineBusinessModel>, GetlistLineBusinessParams> {
  final LineBusinessRepository repository;
  LineBusinessGetlist({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<LineBusinessModel>>> call(
      GetlistLineBusinessParams params) async {
   try {
      final response = await repository.getListLineBusiness(institutionId: params.idInstitution);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class GetlistLineBusinessParams {
  final int idInstitution;
  GetlistLineBusinessParams({
    required this.idInstitution,
  });
}

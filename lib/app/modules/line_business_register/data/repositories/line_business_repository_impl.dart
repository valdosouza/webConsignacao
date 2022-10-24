// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/line_business_data_source.dart';
import 'package:appweb/app/modules/line_business_register/domain/entities/line_business.dart';
import 'package:appweb/app/modules/line_business_register/domain/repositories/line_business_repository.dart';

class LineBusinessRepositoryImpl extends LineBusinessRepository {

  final LineBusinessDataSource datasource;
  LineBusinessRepositoryImpl({
    required this.datasource,
  });


  @override
  Future<Either<Failure, String>> addPayment({required LineBusinessEntity lineBusinessEntity}) async {
    // TODO: implement addPayment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletePayment({required int lineBusinessId}) async {
    // TODO: implement deletePayment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LineBusinessEntity>>> getList({required int institutionId}) async {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> putPayment({required LineBusinessEntity lineBusinessEntity}) async {
    // TODO: implement putPayment
    throw UnimplementedError();
  }

}

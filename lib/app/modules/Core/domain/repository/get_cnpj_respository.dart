import 'package:appweb/app/modules/Core/data/model/identification_company_model.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class GetCnpjRepository {
  Future<Either<Failure, IdentificationCompanyModel>> getCnpj(
      {required String cnpj});
}

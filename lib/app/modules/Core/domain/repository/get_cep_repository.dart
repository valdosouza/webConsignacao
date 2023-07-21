import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class GetCepRepository {
  Future<Either<Failure, AddressModel>> getCEP({required String cep});
}

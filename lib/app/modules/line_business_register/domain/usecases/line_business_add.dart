import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repositories/line_business_repository.dart';
import 'package:dartz/dartz.dart';

class LineBusinessAdd extends UseCase<String, AddLineBusinessParams> {
  final LineBusinessRepository repository;

  LineBusinessAdd({required this.repository});
  
  @override
  Future<Either<Failure, String>> call(AddLineBusinessParams params) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class AddLineBusinessParams {
  final LineBusinessModel businessModel;
  AddLineBusinessParams({
    required this.businessModel,
  });
}

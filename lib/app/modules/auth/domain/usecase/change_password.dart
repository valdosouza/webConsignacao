import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePassword implements UseCase<String, ParamsChange> {
  final AuthRepository repository;

  ChangePassword({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsChange params) async {
    try {
      final change = await repository.changePassword(
        model: params.model,
      );

      return change;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsChange {
  final AuthChangePasswordModel model;

  const ParamsChange({
    required this.model,
  });
}

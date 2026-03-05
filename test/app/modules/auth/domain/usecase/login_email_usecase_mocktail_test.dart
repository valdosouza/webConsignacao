import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:appweb/app/modules/auth/domain/usecase/login_email.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginEmail usecase;
  late MockAuthRepository mockRepository;

  const tAuthModel = AuthModel(
    auth: true,
    id: 1,
    tbInstitutionId: 1,
    username: 'test@test.com',
    password: '',
    jwt: 'jwt',
    error: '',
  );

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = LoginEmail(repository: mockRepository);
  });

  group('LoginEmail', () {
    test('returns Right(AuthModel) when repository succeeds', () async {
      when(() => mockRepository.loginEmail(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Right(tAuthModel));

      final result = await usecase(
        const Params(username: 'test@test.com', password: 'pass'),
      );

      expect(result, const Right(tAuthModel));
      verify(() => mockRepository.loginEmail(
            username: 'test@test.com',
            password: 'pass',
          )).called(1);
    });

    test('returns Left(Failure) when repository returns Left', () async {
      when(() => mockRepository.loginEmail(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(
        const Params(username: 'x', password: 'y'),
      );

      expect(result.isLeft(), true);
    });
  });
}

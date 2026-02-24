import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthModel mapper', () {
    test('fromJson then toJson round-trip preserves data', () {
      const model = AuthModel(
        auth: true,
        id: 2,
        tbInstitutionId: 1,
        username: 'valdo@setes.com.br',
        password: 'hashed',
        kindDevice: 'APP WEB',
        jwt: 'StringJWT',
        error: '',
      );
      final json = model.toJson();
      final back = AuthModel.fromJson(json);
      expect(back.auth, model.auth);
      expect(back.id, model.id);
      expect(back.tbInstitutionId, model.tbInstitutionId);
      expect(back.username, model.username);
      expect(back.password, model.password);
      expect(back.kindDevice, model.kindDevice);
      expect(back.jwt, model.jwt);
      expect(back.error, model.error);
    });

    test('fromJson parses snake_case keys correctly', () {
      final json = {
        'auth': true,
        'id': 1,
        'tb_institution_id': 10,
        'username': 'a@b.com',
        'password': 'p',
        'kind_device': 'APP MOBILE',
        'jwt': 'token',
        'error': 'err',
      };
      final model = AuthModel.fromJson(json);
      expect(model.auth, true);
      expect(model.tbInstitutionId, 10);
      expect(model.kindDevice, 'APP MOBILE');
    });
  });
}

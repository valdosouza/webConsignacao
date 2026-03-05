import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SalesmanModel', () {
    test('empty() returns model with default values', () {
      final model = SalesmanModel.empty();

      expect(model.id, 0);
      expect(model.tbInstitutionId, 0);
      expect(model.nameCompany, '');
      expect(model.nickTrade, '');
    });

    test('fromJson parses id, tb_institution_id, name_company, nick_trade', () {
      final json = {
        'id': 1,
        'tb_institution_id': 10,
        'name_company': 'Empresa Teste',
        'nick_trade': 'Nick',
      };

      final model = SalesmanModel.fromJson(json);

      expect(model.id, 1);
      expect(model.tbInstitutionId, 10);
      expect(model.nameCompany, 'Empresa Teste');
      expect(model.nickTrade, 'Nick');
    });
  });
}

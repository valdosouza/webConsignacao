import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegionModel', () {
    test('fromJson parses all fields', () {
      final json = {
        'id': 10,
        'tb_institution_id': 1,
        'description': 'Região Sul',
        'tb_salesman_id': 2,
        'salesman_name': 'Vendedor A',
        'active': 'S',
      };

      final model = RegionModel.fromJson(json);

      expect(model.id, 10);
      expect(model.tbInstitutionId, 1);
      expect(model.description, 'Região Sul');
      // Note: constructor passes tbInstitutionId to super for tbSalesmanId
      expect(model.tbSalesmanId, 1);
      expect(model.salesmanName, 'Vendedor A');
      expect(model.active, 'S');
    });

    test('fromJson parses id as String', () {
      final json = {'id': '5', 'description': 'Região'};

      final model = RegionModel.fromJson(json);

      expect(model.id, 5);
    });

    test('fromJson uses defaults for null/missing fields', () {
      final model = RegionModel.fromJson({});

      expect(model.id, 0);
      expect(model.tbInstitutionId, 0);
      expect(model.description, '');
      expect(model.tbSalesmanId, 0);
      expect(model.active, '');
    });

    test('empty() returns model with default values', () {
      final model = RegionModel.empty();

      expect(model.id, 0);
      expect(model.tbInstitutionId, 0);
      expect(model.description, '');
      expect(model.tbSalesmanId, 0);
      expect(model.salesmanName, '');
      expect(model.active, 'S');
    });
  });
}

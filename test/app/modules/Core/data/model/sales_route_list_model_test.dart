import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SalesRouteListModel', () {
    test('fromJson parses all fields', () {
      final json = {
        'id': 10,
        'tb_institution_id': 1,
        'description': 'Rota Centro',
        'active': 'S',
        'street': 'Rua A',
        'nmbr': '100',
        'complement': 'Sala 1',
      };

      final model = SalesRouteListModel.fromJson(json);

      expect(model.id, 10);
      expect(model.tbInstitutionId, 1);
      expect(model.description, 'Rota Centro');
      expect(model.active, 'S');
      expect(model.street, 'Rua A');
      expect(model.nmbr, '100');
      expect(model.complement, 'Sala 1');
    });

    test('fromJson parses id as String', () {
      final json = {'id': '5', 'description': 'Rota'};

      final model = SalesRouteListModel.fromJson(json);

      expect(model.id, 5);
    });

    test('fromJson uses defaults for null/missing fields', () {
      final model = SalesRouteListModel.fromJson({});

      expect(model.id, 0);
      expect(model.tbInstitutionId, 0);
      expect(model.description, '');
      expect(model.active, '');
      expect(model.street, '');
      expect(model.nmbr, '');
      expect(model.complement, '');
    });
  });
}

import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomerListByRouteModel', () {
    test('fromJson parses all fields', () {
      final json = {
        'tb_customer_id': 42,
        'name_company': 'Empresa LTDA',
        'nick_trade': 'Cliente Rota',
        'doc_kind': 'CNPJ',
        'doc_number': '12345678000199',
        'tb_sales_route_id': 2,
        'name_sales_route': 'Rota Norte',
        'default_seq': 1,
        'sequence': 3,
        'turn_back': 'S',
        'street': 'Rua X',
        'nmbr': '50',
        'complement': 'Galpão',
      };

      final model = CustomerListByRouteModel.fromJson(json);

      expect(model.id, 42);
      expect(model.nameCompany, 'Empresa LTDA');
      expect(model.nickTrade, 'Cliente Rota');
      expect(model.tbSalesRouteId, 2);
      expect(model.nameSalesRoute, 'Rota Norte');
      expect(model.defaultSeq, 1);
      expect(model.sequence, 3);
      expect(model.turnBack, 'S');
      expect(model.street, 'Rua X');
      expect(model.nmbr, '50');
      expect(model.complement, 'Galpão');
    });

    test('fromJson uses defaults for null/missing fields', () {
      final model = CustomerListByRouteModel.fromJson({});

      expect(model.id, 0);
      expect(model.nameCompany, '');
      expect(model.nickTrade, '');
      expect(model.tbSalesRouteId, 0);
      expect(model.nameSalesRoute, '');
      expect(model.defaultSeq, 0);
      expect(model.sequence, 0);
      expect(model.turnBack, 'N');
      expect(model.street, '');
      expect(model.nmbr, '');
      expect(model.complement, '');
    });

    test('constructor uses defaults for null params', () {
      final model = CustomerListByRouteModel();

      expect(model.id, 0);
      expect(model.nickTrade, '');
      expect(model.sequence, 0);
      expect(model.turnBack, 'N');
    });
  });
}

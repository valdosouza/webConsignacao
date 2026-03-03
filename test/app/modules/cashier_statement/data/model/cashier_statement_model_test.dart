import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CashierStatementModel', () {
    test('empty() returns model with default values', () {
      final model = CashierStatementModel.empty();

      expect(model.description, '');
      expect(model.tagValue, 0);
      expect(model.kind, 'info');
      expect(model.color, 'black');
    });

    test('fromJson parses description and tag_value', () {
      final json = {
        'description': 'Vendas',
        'tag_value': 100.50,
        'kind': 'S',
        'color': 'blue',
      };

      final model = CashierStatementModel.fromJson(json);

      expect(model.description, 'Vendas');
      expect(model.tagValue, 100.50);
      expect(model.kind, 'S');
      expect(model.color, 'blue');
    });

    test('fromJson handles tag_value as int', () {
      final json = {
        'description': 'Total',
        'tag_value': 99,
        'kind': 'S',
        'color': 'black',
      };

      final model = CashierStatementModel.fromJson(json);

      expect(model.description, 'Total');
      expect(model.tagValue, 99.0);
    });
  });
}

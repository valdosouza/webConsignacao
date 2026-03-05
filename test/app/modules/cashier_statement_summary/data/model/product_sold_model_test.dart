import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_sold_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductSoldModel', () {
    test('empty() returns model with default values', () {
      final model = ProductSoldModel.empty();

      expect(model.id, 0);
      expect(model.description, '');
      expect(model.value, 0.0);
    });

    test('fromJson parses id, description and value', () {
      final json = {
        'id': 1,
        'description': 'Produto A',
        'value': 99.50,
      };

      final model = ProductSoldModel.fromJson(json);

      expect(model.id, 1);
      expect(model.description, 'Produto A');
      expect(model.value, 99.50);
    });

    test('fromJson handles value as int', () {
      final json = {
        'id': 2,
        'description': 'Produto B',
        'value': 100,
      };

      final model = ProductSoldModel.fromJson(json);

      expect(model.value, 100.0);
    });
  });
}

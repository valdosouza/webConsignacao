import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SummaryModel', () {
    test('empty() returns model with default values', () {
      final model = SummaryModel.empty();

      expect(model.day, 1);
      expect(model.weekDay, '');
      expect(model.oldDebit, 0.0);
      expect(model.debitBalance, 0.0);
      expect(model.totalReceived, 0.0);
      expect(model.productSoldList, isNotEmpty);
      expect(model.productBonusList, isEmpty);
      expect(model.productLoadList, isEmpty);
    });

    test('fromJson parses day, weekDay and numeric fields', () {
      final json = {
        'day': 15,
        'week_day': 'SEGUNDA',
        'product_sold_list': [],
        'old_debit': 100.50,
        'debit_balance': 200.0,
        'total_received': 1500.0,
        'sales_points': 10,
        'product_bonus_list': [],
        'product_load_list': [],
      };

      final model = SummaryModel.fromJson(json);

      expect(model.day, 15);
      expect(model.weekDay, 'SEGUNDA');
      expect(model.oldDebit, 100.50);
      expect(model.debitBalance, 200.0);
      expect(model.totalReceived, 1500.0);
      expect(model.salesPoints, 10);
      expect(model.productSoldList, isEmpty);
      expect(model.productBonusList, isEmpty);
      expect(model.productLoadList, isEmpty);
    });

    test('fromJson handles int for old_debit and debit_balance', () {
      final json = {
        'day': 1,
        'week_day': 'DOM',
        'product_sold_list': [],
        'old_debit': 50,
        'debit_balance': 75,
        'total_received': 100,
        'sales_points': 0,
        'product_bonus_list': [],
        'product_load_list': [],
      };

      final model = SummaryModel.fromJson(json);

      expect(model.oldDebit, 50.0);
      expect(model.debitBalance, 75.0);
      expect(model.totalReceived, 100.0);
    });
  });
}

import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CashierBalanceModel', () {
    test('empty() returns model with empty dtRecord and items', () {
      final model = CashierBalanceModel.empty();

      expect(model.dtRecord, '');
      expect(model.items, isEmpty);
    });

    test('fromJson parses dt_record and items', () {
      final json = {
        'dt_record': '2025-02-24',
        'items': [
          {
            'name_payment_type': 'Dinheiro',
            'balance_value': 100.50,
          },
          {
            'name_payment_type': 'PIX',
            'balance_value': 200.0,
          },
        ],
      };

      final model = CashierBalanceModel.fromJson(json);

      expect(model.dtRecord, '24/02/2025');
      expect(model.items.length, 2);
      expect(model.items[0].namePaymentType, 'Dinheiro');
      expect(model.items[0].balanceValue, 100.50);
      expect(model.items[1].namePaymentType, 'PIX');
      expect(model.items[1].balanceValue, 200.0);
    });

    test('fromJson handles balance_value as int', () {
      final json = {
        'dt_record': '2025-02-24',
        'items': [
          {'name_payment_type': 'Cartão', 'balance_value': 50},
        ],
      };

      final model = CashierBalanceModel.fromJson(json);

      expect(model.items[0].balanceValue, 50.0);
    });

    test('fromJson handles null dt_record as empty string', () {
      final json = {
        'dt_record': null,
        'items': [],
      };

      final model = CashierBalanceModel.fromJson(json);

      expect(model.dtRecord, '');
    });
  });

  group('CashierBalanceItemsModel', () {
    test('empty() returns item with empty name and zero value', () {
      final item = CashierBalanceItemsModel.empty();

      expect(item.namePaymentType, '');
      expect(item.balanceValue, 0);
    });

    test('fromJson parses name_payment_type and balance_value', () {
      final json = {
        'name_payment_type': 'Dinheiro',
        'balance_value': 150.75,
      };

      final item = CashierBalanceItemsModel.fromJson(json);

      expect(item.namePaymentType, 'Dinheiro');
      expect(item.balanceValue, 150.75);
    });
  });
}

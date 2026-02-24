import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeSalesPaymentTypeModel mapper', () {
    test('fromJson then toJson round-trip preserves data', () {
      const model = HomeSalesPaymentTypeModel(
        paymentType: '1 - DINHEIRO',
        totalQtty: 2,
        totalValue: 6466.52,
      );
      final json = model.toJson();
      final back = HomeSalesPaymentTypeModel.fromJson(json);
      expect(back.paymentType, model.paymentType);
      expect(back.totalQtty, model.totalQtty);
      expect(back.totalValue, model.totalValue);
    });

    test('fromJson parses string numbers correctly', () {
      final json = {
        'paymentType': 'PIX',
        'totalQtty': '3',
        'totalValue': '100.5',
      };
      final model = HomeSalesPaymentTypeModel.fromJson(json);
      expect(model.paymentType, 'PIX');
      expect(model.totalQtty, 3);
      expect(model.totalValue, 100.5);
    });
  });
}

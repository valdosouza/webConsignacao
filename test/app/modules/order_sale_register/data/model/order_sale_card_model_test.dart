import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('OrderSaleCardModel.fromJson defaults subtotal when missing', () {
    final card = OrderSaleCardModel.fromJson({
      'tb_product_id': 1,
      'name_product': 'Choim Am',
      'bonus': 0.0,
      'sale': 10.0,
      'unit_value': 2.1,
      // subtotal omitted by API
    });

    expect(card.subtotal, 0.0);
  });
}

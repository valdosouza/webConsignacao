import 'package:appweb/app/modules/order_load_card_register/domain/entity/order_load_card_items_entity.dart';

class OrderLoadCardItemsModel extends OrderLoadCardItemsEntity {
  int tbProductId;
  String nameProduct;
  double stockBalance;
  double bonus;
  double sale;
  double adjust;
  double newLoad;

  OrderLoadCardItemsModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.stockBalance,
    required this.sale,
    required this.bonus,
    required this.adjust,
    required this.newLoad,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          stockBalance: stockBalance,
          sale: sale,
          bonus: bonus,
          adjust: adjust,
          newLoad: newLoad,
        );

  factory OrderLoadCardItemsModel.fromJson(Map<String?, dynamic> json) {
    return OrderLoadCardItemsModel(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'] as String,
      stockBalance: json['stock_balance'] is int
          ? json['stock_balance'].toDouble()
          : json['stock_balance'],
      sale: json['sale'] is int ? json['sale'].toDouble() : json['sale'],
      bonus: json['bonus'] is int ? json['bonus'].toDouble() : json['bonus'],
      adjust:
          json['adjust'] is int ? json['adjust'].toDouble() : json['adjust'],
      newLoad: json['new_load'] is int
          ? json['new_load'].toDouble()
          : json['newLoad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'name_product': nameProduct,
      'stock_balance': stockBalance,
      'sale': sale,
      'bonus': bonus,
      'adjust': adjust,
      'new_load': newLoad,
    };
  }

  factory OrderLoadCardItemsModel.isEmpty() {
    return OrderLoadCardItemsModel(
      tbProductId: 0,
      nameProduct: "",
      stockBalance: 0,
      sale: 0,
      bonus: 0,
      adjust: 0,
      newLoad: 0,
    );
  }
}

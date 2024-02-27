import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_model.dart';

import '../../domain/entity/order_sale_main_card_entity.dart';

class OrderSaleMainCardModel extends OrderSaleMainCardEntity {
  OrderSaleModel order;
  List<OrderSaleCardModel> items;
  List<OrderPaidModel> payments;

  OrderSaleMainCardModel({
    required this.order,
    required this.items,
    required this.payments,
  }) : super(order: order, items: items, payments: payments);

  factory OrderSaleMainCardModel.fromJson(Map<String, dynamic> json) {
    return OrderSaleMainCardModel(
      order: OrderSaleModel.fromJson(json['order']),
      items: (json['items'] as List)
          .map((e) => OrderSaleCardModel.fromJson(e))
          .toList(),
      payments: (json['payments'] as List)
          .map((e) => OrderPaidModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order.toJson();
    data['items'] = items.map((i) => i.toJson()).toList();
    data['payments'] = payments.map((p) => p.toJson()).toList();
    return data;
  }

  factory OrderSaleMainCardModel.isEmpty() {
    return OrderSaleMainCardModel(
      order: OrderSaleModel(
        id: 0,
        tbInstitutionId: 0,
        tbCustomerId: 0,
        nameCustomer: "",
        tbUserId: 0,
        number: 0,
        tbSalesmanId: 0,
        nameSalesman: "",
        dtRecord: CustomDate.newDate(),
        hrRecord: "",
        totalValue: 0,
        changeValue: 0,
        note: "",
        status: "A",
      ),
      items: [],
      payments: [],
    );
  }
}

class OrderSaleCardModel extends OrderSaleCardEntity {
  int tbProductId;
  String nameProduct;
  double bonus;
  double sale;
  double unitValue;
  double subtotal;
  OrderSaleCardModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.bonus,
    required this.sale,
    required this.unitValue,
    required this.subtotal,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          sale: sale,
          unitValue: unitValue,
          subtotal: subtotal,
        );

  factory OrderSaleCardModel.fromJson(Map<String?, dynamic> json) {
    return OrderSaleCardModel(
      tbProductId: json['tb_product_id'] is int
          ? json['tb_product_id']
          : int.parse(json['tb_product_id']),
      nameProduct: json['name_product'] as String,
      bonus: json['bonus'] is int ? json['bonus'].toDouble() : json['bonus'],
      sale: json['sale'] is int ? json['sale'].toDouble() : json['sale'],
      unitValue: json['unit_value'] is int
          ? json['unit_value'].toDouble()
          : json['unit_value'],
      subtotal: json['subtotal'] is int
          ? json['subtotal'].toDouble()
          : json['subtotal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'name_product': nameProduct,
      'bonus': bonus,
      'sale': sale,
      'unit_value': unitValue,
    };
  }

  factory OrderSaleCardModel.isEmpty() {
    return OrderSaleCardModel(
      tbProductId: 0,
      nameProduct: "",
      bonus: 0,
      sale: 0,
      unitValue: 0,
      subtotal: 0,
    );
  }
}

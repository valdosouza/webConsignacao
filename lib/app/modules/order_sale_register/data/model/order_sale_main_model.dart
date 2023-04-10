import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_register_items_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_register_model.dart';

class OrderSaleMainModel {
  late OrderSaleRegisterModel order = OrderSaleRegisterModel.empty();
  late List<OrderSaleRegisterItemsModel> items = [];

  OrderSaleMainModel({
    required this.order,
    required this.items,
  });

  factory OrderSaleMainModel.fromJson(Map<String, dynamic> json) =>
      OrderSaleMainModel(
        order: OrderSaleRegisterModel.fromJson(json["Order"]),
        items: List<OrderSaleRegisterItemsModel>.from(
          json["Items"].map(
            (x) => OrderSaleRegisterItemsModel.fromJson(x),
          ),
        ),
      );

  factory OrderSaleMainModel.empty() => OrderSaleMainModel(
        order: OrderSaleRegisterModel.empty(),
        items: [],
      );

  Map<String, dynamic> toJson() => {
        "Order": order.toJson(),
        "Items": items.map((e) => e.toJson()).toList(),
      };
}

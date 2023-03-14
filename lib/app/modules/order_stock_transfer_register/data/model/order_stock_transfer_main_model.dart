import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_model.dart';

class OrderStockTransferMainModel {
  late OrderStockTransferRegisterModel order =
      OrderStockTransferRegisterModel.empty();
  late List<OrderStockTransferRegisterItemsModel> items = [];

  OrderStockTransferMainModel({
    required this.order,
    required this.items,
  });

  factory OrderStockTransferMainModel.fromJson(Map<String, dynamic> json) =>
      OrderStockTransferMainModel(
        order: OrderStockTransferRegisterModel.fromJson(json["Order"]),
        items: List<OrderStockTransferRegisterItemsModel>.from(
          json["Items"].map(
            (x) => OrderStockTransferRegisterItemsModel.fromJson(x),
          ),
        ),
      );

  factory OrderStockTransferMainModel.empty() => OrderStockTransferMainModel(
        order: OrderStockTransferRegisterModel.empty(),
        items: [],
      );

  Map<String, dynamic> toJson() => {
        "Order": order.toJson(),
        "Items": items.map((e) => e.toJson()).toList(),
      };
}

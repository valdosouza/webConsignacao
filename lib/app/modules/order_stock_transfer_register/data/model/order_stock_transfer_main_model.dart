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
        order: OrderStockTransferRegisterModel.fromJson(json["order"]),
        items: List<OrderStockTransferRegisterItemsModel>.from(
          json["items"].map(
            (x) => OrderStockTransferRegisterItemsModel.fromJson(x),
          ),
        ),
      );

  factory OrderStockTransferMainModel.empty() => OrderStockTransferMainModel(
        order: OrderStockTransferRegisterModel.empty(),
        items: [],
      );

  Map<String, dynamic> toJson() => {
        "order": order.toJson(),
        "items": items.map((e) => e.toJson()).toList(),
      };
}

import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/entity/order_consignment_supplying_entity.dart';

class OrderConsignmentSupplyingModel extends OrderConsignmentSupplyingEntity {
  OrderConsignmentSupplyingOrderModel order;
  List<OrderConsignmentSupplyingItemsModel> items;

  OrderConsignmentSupplyingModel({
    required this.order,
    required this.items,
  }) : super(
          order: order,
          items: items,
        );

  factory OrderConsignmentSupplyingModel.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentSupplyingModel(
      order: OrderConsignmentSupplyingOrderModel.fromJson(json['Order']),
      items: (json['Items'] as List).map((e) {
        return OrderConsignmentSupplyingItemsModel.fromJson(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Order': order.toJson(),
      'Items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory OrderConsignmentSupplyingModel.isEmpty() {
    return OrderConsignmentSupplyingModel(
      order: OrderConsignmentSupplyingOrderModel(
          id: 1,
          tbInstitutionId: 1,
          tbCustomerId: 51,
          nameCustomer: "",
          currentDebitBalance: 0),
      items: [],
    );
  }
  factory OrderConsignmentSupplyingModel.fromCheckpoint(
      OrderConsignmentCheckpointModel checkpoint) {
    var order = OrderConsignmentSupplyingOrderModel(
      id: checkpoint.order.id,
      tbInstitutionId: checkpoint.order.tbInstitutionId,
      tbCustomerId: checkpoint.order.tbCustomerId,
      nameCustomer: checkpoint.order.nameCustomer,
      currentDebitBalance: checkpoint.order.currentDebitBalance,
    );
    List<OrderConsignmentSupplyingItemsModel> listItems = [];
    for (OrderConsignmentCheckpointItemsModel item in checkpoint.items) {
      listItems.add(OrderConsignmentSupplyingItemsModel(
        tbProductId: item.tbProductId,
        bonus: item.bonus,
        nameProduct: item.nameProduct,
        leftover: item.leftover,
        devolution: 0,
        newConsignment: 0,
        qtyConsigned: item.leftover,
        unitValue: item.unitValue,
      ));
    }

    return OrderConsignmentSupplyingModel(
      order: order,
      items: listItems,
    );
  }
}

class OrderConsignmentSupplyingOrderModel
    extends OrderConsignmentSupplyingOrderEntity {
  int id;
  int tbInstitutionId;
  int tbCustomerId;
  String nameCustomer;
  double currentDebitBalance;

  OrderConsignmentSupplyingOrderModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbCustomerId,
    required this.nameCustomer,
    required this.currentDebitBalance,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          currentDebitBalance: currentDebitBalance,
        );

  factory OrderConsignmentSupplyingOrderModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentSupplyingOrderModel(
      id: json['id'] as int? ?? 0,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      tbCustomerId: json['tb_customer_id'] as int? ?? 0,
      nameCustomer: json['name_customer'] as String? ?? "",
      currentDebitBalance: double.parse(json['current_debit_balance']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tb_institution_id': tbInstitutionId,
      'tb_customer_id': tbCustomerId,
      'name_customer': nameCustomer,
      'current_debit_balance': currentDebitBalance,
    };
  }
}

class OrderConsignmentSupplyingItemsModel
    extends OrderConsignmentSupplyingItemsEntity {
  int tbProductId;
  String nameProduct;
  double bonus;
  double leftover;
  double devolution;
  double newConsignment;
  double qtyConsigned;
  double unitValue;

  OrderConsignmentSupplyingItemsModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.bonus,
    required this.leftover,
    required this.devolution,
    required this.newConsignment,
    required this.qtyConsigned,
    required this.unitValue,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          leftover: leftover,
          devolution: devolution,
          newConsignment: newConsignment,
          qtyConsigned: qtyConsigned,
          unitValue: unitValue,
        );

  factory OrderConsignmentSupplyingItemsModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentSupplyingItemsModel(
      tbProductId: json['tb_product_id'] as int? ?? 0,
      nameProduct: json['name_product'] as String? ?? "",
      bonus: double.parse(json['bonus']),
      leftover: double.parse(json['leftover']),
      devolution: double.parse(json['devolution']),
      newConsignment: double.parse(json['new_consignment']),
      qtyConsigned: double.parse(json['qty_consigned']),
      unitValue: double.parse(json['unit_value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'name_product': nameProduct,
      'bonus': bonus,
      'leftover': leftover,
      'devolution': devolution,
      'new_consignment': newConsignment,
      'qty_consigned': qtyConsigned,
    };
  }
}

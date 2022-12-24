import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';

import '../../domain/entity/order_consignment_checkpoint_entity.dart';

class OrderConsignmentCheckpointModel extends OrderConsignmentCheckpointEntity {
  OrderConsignmentCheckpointOrderModel order;
  List<OrderConsignmentCheckpointItemsModel> items;
  List<OrderConsignmentCheckpointPaymentModel> payments;

  OrderConsignmentCheckpointModel({
    required this.order,
    required this.items,
    required this.payments,
  }) : super(order: order, items: items, payments: payments);

  factory OrderConsignmentCheckpointModel.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentCheckpointModel(
      order: OrderConsignmentCheckpointOrderModel.fromJson(json['order']),
      items: (json['Items'] as List)
          .map((e) => OrderConsignmentCheckpointItemsModel.fromJson(e))
          .toList(),
      payments: (json['Payments'] as List)
          .map((e) => OrderConsignmentCheckpointPaymentModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Order'] = order.toJson();
    data['Items'] = items.map((v) => v.toJson()).toList();
    data['Payments'] = payments.map((v) => v.toJson()).toList();
    return data;
  }

  factory OrderConsignmentCheckpointModel.isEmpty() {
    return OrderConsignmentCheckpointModel(
      order: OrderConsignmentCheckpointOrderModel(
        id: 0,
        tbInstitutionId: 1,
        tbCustomerId: 0,
        nameCustomer: "",
        dtRecord:
            CustomDate.formatDate(DateTime.now().toString(), "dd/MM/yyyy"),
        totalValue: 0,
        changeValue: 0,
        previousDebiBalance: 0,
        currentDebitBalance: 0,
      ),
      items: [],
      payments: [],
    );
  }

  factory OrderConsignmentCheckpointModel.fromSupplying(
      OrderConsignmentSupplyingModel supplying) {
    var order = OrderConsignmentCheckpointOrderModel(
      id: supplying.order.id,
      tbInstitutionId: supplying.order.tbInstitutionId,
      tbCustomerId: supplying.order.tbCustomerId,
      nameCustomer: supplying.order.nameCustomer,
      dtRecord: CustomDate.formatDate(CustomDate.newDate(), "dd/MM/yyyy"),
      totalValue: 0,
      changeValue: 0,
      previousDebiBalance: supplying.order.currentDebitBalance,
      currentDebitBalance: 0,
    );

    List<OrderConsignmentCheckpointItemsModel> listItems = [];
    for (OrderConsignmentSupplyingItemsModel item in supplying.items) {
      listItems.add(OrderConsignmentCheckpointItemsModel(
        tbProductId: item.tbProductId,
        nameProduct: item.nameProduct,
        bonus: item.bonus,
        leftover: 0.0,
        qtyConsigned: item.qtyConsigned,
        qtySold: 0,
        unitValue: item.unitValue,
        subtotal: 0,
      ));
    }
    List<OrderConsignmentCheckpointPaymentModel> listpayment = [];
    listpayment.add(OrderConsignmentCheckpointPaymentModel(
      tbPaymentTypeId: 1,
      namePaymentType: 'DINHEIRO',
      value: 0,
    ));
    listpayment.add(OrderConsignmentCheckpointPaymentModel(
      tbPaymentTypeId: 2,
      namePaymentType: 'PIX',
      value: 0,
    ));

    return OrderConsignmentCheckpointModel(
      order: order,
      items: listItems,
      payments: listpayment,
    );
  }
}

class OrderConsignmentCheckpointOrderModel
    extends OrderConsignmentCheckpointOrderEntity {
  int id;
  int tbInstitutionId;
  int tbCustomerId;
  String nameCustomer;
  String dtRecord;
  double totalValue;
  double changeValue;
  double previousDebiBalance;
  double currentDebitBalance;
  OrderConsignmentCheckpointOrderModel(
      {required this.id,
      required this.tbInstitutionId,
      required this.tbCustomerId,
      required this.nameCustomer,
      required this.dtRecord,
      required this.totalValue,
      required this.changeValue,
      required this.previousDebiBalance,
      required this.currentDebitBalance})
      : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          dtRecord: dtRecord,
          totalValue: totalValue,
          changeValue: changeValue,
          previousDebiBalance: previousDebiBalance,
          currentDebitBalance: currentDebitBalance,
        );

  factory OrderConsignmentCheckpointOrderModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentCheckpointOrderModel(
      id: json['id'] as int? ?? 0,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      tbCustomerId: json['tb_customer_id'] as int? ?? 0,
      nameCustomer: json['name_customer'] as String? ?? "",
      dtRecord:
          CustomDate.formatDate(json['dt_record'], "dd/MM/yyyy") as String? ??
              "",
      totalValue: double.parse(json['total_value']),
      changeValue: double.parse(json['change_value']),
      previousDebiBalance: double.parse(json['previous_debit_balance']),
      currentDebitBalance: double.parse(json['current_debit_balance']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tb_institution_id': tbInstitutionId,
      'tb_customer_id': tbCustomerId,
      'name_customer': nameCustomer,
      'dt_record': CustomDate.convertDate(dtRecord),
      'total_value': totalValue,
      'change_value': changeValue,
      'previous_debit_balance': previousDebiBalance,
      'current_debit_balance': currentDebitBalance,
    };
  }
}

class OrderConsignmentCheckpointItemsModel
    extends OrderConsignmentCheckpointItemsEntity {
  int tbProductId;
  String nameProduct;
  double bonus;
  double qtyConsigned;
  double leftover;
  double qtySold;
  double unitValue;
  double subtotal;
  OrderConsignmentCheckpointItemsModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.bonus,
    required this.qtyConsigned,
    required this.leftover,
    required this.qtySold,
    required this.unitValue,
    required this.subtotal,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          qtyConsigned: qtyConsigned,
          leftover: leftover,
          qtySold: qtySold,
          unitValue: unitValue,
          subtotal: subtotal,
        );

  factory OrderConsignmentCheckpointItemsModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentCheckpointItemsModel(
      tbProductId: json['tb_product_id'] as int? ?? 0,
      nameProduct: json['name_product'] as String? ?? "",
      bonus: double.parse(json['bonus']),
      qtyConsigned: double.parse(json['qty_consigned']),
      leftover: double.parse(json['leftover']),
      qtySold: double.parse(json['qty_sold']),
      unitValue: double.parse(json['unit_value']),
      subtotal: ((double.parse(json['qty_sold'])) *
          (double.parse(json['unit_value']))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'name_product': nameProduct,
      'bonus': bonus,
      'qty_consigned': qtyConsigned,
      'leftover': leftover,
      'qty_sold': qtySold,
      'unit_value': unitValue,
    };
  }
}

class OrderConsignmentCheckpointPaymentModel
    extends OrderConsignmentCheckpointPaymentEntity {
  int tbPaymentTypeId;
  String namePaymentType;
  double value;

  OrderConsignmentCheckpointPaymentModel({
    required this.tbPaymentTypeId,
    required this.namePaymentType,
    required this.value,
  }) : super(
          tbPaymentTypeId: tbPaymentTypeId,
          namePaymentType: namePaymentType,
          value: value,
        );

  factory OrderConsignmentCheckpointPaymentModel.fromJson(
      Map<String, dynamic> json) {
    return OrderConsignmentCheckpointPaymentModel(
      tbPaymentTypeId: int.parse(json['tb_payment_type_id'].toString()),
      namePaymentType: json['name_payment_type'].toString(),
      value: double.parse(json['value'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_payment_type_id': tbPaymentTypeId,
      'name_payment_type': namePaymentType,
      'value': value,
    };
  }
}

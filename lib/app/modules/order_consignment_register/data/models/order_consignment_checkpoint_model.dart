import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';

import '../../domain/entity/order_consignment_checkpoint_entity.dart';

class OrderConsignmentCheckpointModel extends OrderConsignmentCheckpointEntity {
  OrderConsignmentCheckpointOrderModel order;
  List<OrderConsignmentCheckpointCardModel> items;
  List<OrderPaidModel> payments;

  OrderConsignmentCheckpointModel({
    required this.order,
    required this.items,
    required this.payments,
  }) : super(order: order, items: items, payments: payments);

  factory OrderConsignmentCheckpointModel.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentCheckpointModel(
      order: OrderConsignmentCheckpointOrderModel.fromJson(json['order']),
      items: (json['Items'] as List)
          .map((e) => OrderConsignmentCheckpointCardModel.fromJson(e))
          .toList(),
      payments: (json['Payments'] as List)
          .map((e) => OrderPaidModel.fromJson(e))
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
        dtRecord: CustomDate.newDate(),
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
      dtRecord: CustomDate.newDate(),
      totalValue: 0,
      changeValue: 0,
      previousDebiBalance: supplying.order.currentDebitBalance,
      currentDebitBalance: 0,
    );

    List<OrderConsignmentCheckpointCardModel> listItems = [];
    for (OrderConsignmentSupplyingCardModel item in supplying.items) {
      listItems.add(OrderConsignmentCheckpointCardModel(
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
    List<OrderPaidModel> listpayment = [];
    listpayment.add(OrderPaidModel(
      tbPaymentTypeId: 1,
      namePaymentType: 'DINHEIRO',
      dtExpiration: "",
      value: 0,
    ));
    listpayment.add(OrderPaidModel(
      tbPaymentTypeId: 2,
      namePaymentType: 'PIX',
      dtExpiration: "",
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
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbCustomerId: json['tb_customer_id'],
      nameCustomer: json['name_customer'] as String? ?? "",
      dtRecord: CustomDate.formatDateIn(json['dt_record']) as String? ?? "",
      totalValue: json['total_value'],
      changeValue: json['change_value'] is int
          ? json['change_value'].toDouble()
          : json['change_value'],
      previousDebiBalance: json['previous_debit_balance'] is int
          ? json['previous_debit_balance'].toDouble()
          : json['previous_debit_balance'],
      currentDebitBalance: json['current_debit_balance'] is int
          ? json['current_debit_balance'].toDouble()
          : json['current_debit_balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tb_institution_id': tbInstitutionId,
      'tb_customer_id': tbCustomerId,
      'name_customer': nameCustomer,
      'dt_record': CustomDate.formatDateOut(dtRecord),
      'total_value': totalValue,
      'change_value': changeValue,
      'previous_debit_balance': previousDebiBalance,
      'current_debit_balance': currentDebitBalance,
    };
  }
}

class OrderConsignmentCheckpointCardModel
    extends OrderConsignmentCheckpointCardEntity {
  int tbProductId;
  String nameProduct;
  double bonus;
  double qtyConsigned;
  double leftover;
  double qtySold;
  double unitValue;
  double subtotal;
  OrderConsignmentCheckpointCardModel({
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

  factory OrderConsignmentCheckpointCardModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentCheckpointCardModel(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'] as String? ?? "",
      bonus: json['bonus'] is int ? json['bonus'].toDouble() : json['bonus'],
      qtyConsigned: json['qty_consigned'] is int
          ? json['qty_consigned'].toDouble()
          : json['qty_consigned'],
      leftover: json['leftover'] is int
          ? json['leftover'].toDouble()
          : json['leftover'],
      qtySold: json['qty_sold'] is int
          ? json['qty_sold'].toDouble()
          : json['qty_sold'],
      unitValue: json['unit_value'] is int
          ? json['unit_value'].toDouble()
          : json['unit_value'],
      subtotal: ((json['qty_sold']) * (json['unit_value'])),
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

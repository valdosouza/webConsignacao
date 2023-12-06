import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';

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
      items: (json['items'] as List)
          .map((e) => OrderConsignmentCheckpointCardModel.fromJson(e))
          .toList(),
      payments: (json['payments'] as List)
          .map((e) => OrderPaidModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order.toJson();
    data['items'] = items.map((v) => v.toJson()).toList();
    data['payments'] = payments.map((v) => v.toJson()).toList();
    return data;
  }

  factory OrderConsignmentCheckpointModel.isEmpty() {
    return OrderConsignmentCheckpointModel(
      order: OrderConsignmentCheckpointOrderModel(
        id: 0,
        tbInstitutionId: 0,
        tbCustomerId: 0,
        nameCustomer: "",
        tbSalesmanId: 0,
        nameSalesman: "",
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
      tbSalesmanId: supplying.order.tbSalesmanId,
      nameSalesman: supplying.order.nameSalesman,
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
        qttyConsigned: item.qttyConsigned,
        sale: 0,
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
  int tbSalesmanId;
  String nameSalesman;
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
      required this.tbSalesmanId,
      required this.nameSalesman,
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
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'] as String? ?? "",
      dtRecord: CustomDate.formatDateIn(json['dt_record']) as String? ?? "",
      totalValue: json['total_value'] is int
          ? json['total_value'].toDouble()
          : json['total_value'],
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
      'tb_salesman_id': tbSalesmanId,
      'name_salesman': nameSalesman,
      'dt_record':
          dtRecord, //Como não há manipulação nem visualização de dados não é necessário conversão
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
  double qttyConsigned;
  double leftover;
  double sale;
  double unitValue;
  double subtotal;
  OrderConsignmentCheckpointCardModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.bonus,
    required this.qttyConsigned,
    required this.leftover,
    required this.sale,
    required this.unitValue,
    required this.subtotal,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          qttyConsigned: qttyConsigned,
          leftover: leftover,
          sale: sale,
          unitValue: unitValue,
          subtotal: subtotal,
        );

  factory OrderConsignmentCheckpointCardModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentCheckpointCardModel(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'] as String? ?? "",
      bonus: json['bonus'] is int ? json['bonus'].toDouble() : json['bonus'],
      qttyConsigned: json['qtty_consigned'] is int
          ? json['qtty_consigned'].toDouble()
          : json['qtty_consigned'],
      leftover: json['leftover'] is int
          ? json['leftover'].toDouble()
          : json['leftover'],
      sale: json['sale'] is int ? json['sale'].toDouble() : json['sale'],
      unitValue: json['unit_value'] is int
          ? json['unit_value'].toDouble()
          : json['unit_value'],
      subtotal: ((json['sale']) * (json['unit_value'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'name_product': nameProduct,
      'bonus': bonus,
      'qtty_consigned': qttyConsigned,
      'leftover': leftover,
      'sale': sale,
      'unit_value': unitValue,
    };
  }
}

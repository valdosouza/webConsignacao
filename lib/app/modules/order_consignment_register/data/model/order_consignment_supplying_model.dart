import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/entity/order_consignment_supplying_entity.dart';

class OrderConsignmentSupplyingModel extends OrderConsignmentSupplyingEntity {
  OrderConsignmentSupplyingOrderModel order;
  List<OrderConsignmentSupplyingCardModel> items;

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
        return OrderConsignmentSupplyingCardModel.fromJson(e);
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
        id: 0,
        tbInstitutionId: 0,
        tbCustomerId: 0,
        nameCustomer: "",
        tbSalesmanId: 0,
        nameSalesman: "",
        dtRecord: CustomDate.newDate(),
        currentDebitBalance: 0,
        recall: "N",
        note: "",
      ),
      items: [],
    );
  }
  factory OrderConsignmentSupplyingModel.fromCheckpoint(
      OrderConsignmentCheckpointModel checkpoint) {
    var order = OrderConsignmentSupplyingOrderModel(
      id: 0,
      tbInstitutionId: checkpoint.order.tbInstitutionId,
      tbCustomerId: checkpoint.order.tbCustomerId,
      nameCustomer: checkpoint.order.nameCustomer,
      tbSalesmanId: checkpoint.order.tbSalesmanId,
      nameSalesman: checkpoint.order.nameSalesman,
      dtRecord: "",
      currentDebitBalance: checkpoint.order.currentDebitBalance,
      recall: "N",
      note: "",
    );
    List<OrderConsignmentSupplyingCardModel> listItems = [];
    for (OrderConsignmentCheckpointCardModel item in checkpoint.items) {
      listItems.add(OrderConsignmentSupplyingCardModel(
        tbProductId: item.tbProductId,
        bonus: 0,
        nameProduct: item.nameProduct,
        leftover: item.qttyConsigned - item.qttySold,
        devolution: 0,
        newConsignment: 0,
        qttyConsigned: item.qttyConsigned - item.qttySold,
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
  int tbSalesmanId;
  String nameSalesman;
  String dtRecord;
  double currentDebitBalance;
  String recall;
  String note;

  OrderConsignmentSupplyingOrderModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbCustomerId,
    required this.nameCustomer,
    required this.tbSalesmanId,
    required this.nameSalesman,
    required this.dtRecord,
    required this.currentDebitBalance,
    required this.recall,
    required this.note,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          tbSalesmanId: tbSalesmanId,
          nameSalesman: nameSalesman,
          dtRecord: dtRecord,
          currentDebitBalance: currentDebitBalance,
          recall: recall,
          note: note,
        );

  factory OrderConsignmentSupplyingOrderModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentSupplyingOrderModel(
      id: json['id'] as int? ?? 0,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      tbCustomerId: json['tb_customer_id'] as int? ?? 0,
      nameCustomer: json['name_customer'] as String? ?? "",
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'],
      dtRecord: CustomDate.newDate(),
      currentDebitBalance: double.parse(json['current_debit_balance']),
      recall: json['recall'] as String? ?? "N",
      note: json['note'] as String? ?? "",
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
          dtRecord, //Como a consignação não tem campo data, não preicsa de conversão
      'current_debit_balance': currentDebitBalance,
      'recall': recall,
      'note': note,
    };
  }
}

class OrderConsignmentSupplyingCardModel
    extends OrderConsignmentSupplyingCardEntity {
  int tbProductId;
  String nameProduct;
  double bonus;
  double leftover;
  double devolution;
  double newConsignment;
  double qttyConsigned;
  double unitValue;

  OrderConsignmentSupplyingCardModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.bonus,
    required this.leftover,
    required this.devolution,
    required this.newConsignment,
    required this.qttyConsigned,
    required this.unitValue,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          leftover: leftover,
          devolution: devolution,
          newConsignment: newConsignment,
          qttyConsigned: qttyConsigned,
          unitValue: unitValue,
        );

  factory OrderConsignmentSupplyingCardModel.fromJson(
      Map<String?, dynamic> json) {
    return OrderConsignmentSupplyingCardModel(
      tbProductId: json['tb_product_id'] as int? ?? 0,
      nameProduct: json['name_product'] as String? ?? "",
      bonus: double.parse(json['bonus']),
      leftover: double.parse(json['leftover']),
      devolution: double.parse(json['devolution']),
      newConsignment: double.parse(json['new_consignment']),
      qttyConsigned: double.parse(json['qtty_consigned']),
      unitValue: double.parse(json['unit_value']),
    );
  }
  factory OrderConsignmentSupplyingCardModel.isEmpty() {
    return OrderConsignmentSupplyingCardModel(
      tbProductId: 0,
      nameProduct: "",
      bonus: 0.0,
      leftover: 0.0,
      devolution: 0.0,
      newConsignment: 0.0,
      qttyConsigned: 0.0,
      unitValue: 0.0,
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
      'qtty_consigned': qttyConsigned,
      'unit_value': unitValue,
    };
  }
}

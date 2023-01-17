import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_sale_register/domain/entity/order_sale_entity.dart';

class OrderSaleModel extends OrderSaleEntity {
  int id;
  int tbInstitutionId;
  int tbCustomerId;
  String nameCustomer;
  int tbUserId;
  int number;
  int tbSalesmanId;
  String nameSalesman;
  String dtRecord;
  double totalValue;
  double changeValue;
  String note;
  String status;

  OrderSaleModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbCustomerId,
    required this.nameCustomer,
    required this.tbUserId,
    required this.number,
    required this.tbSalesmanId,
    required this.nameSalesman,
    required this.dtRecord,
    required this.totalValue,
    required this.changeValue,
    required this.note,
    required this.status,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          tbUserId: tbUserId,
          number: number,
          tbSalesmanId: tbSalesmanId,
          nameSalesman: nameSalesman,
          dtRecord: dtRecord,
          totalValue: totalValue,
          changeValue: changeValue,
          note: note,
          status: status,
        );

  factory OrderSaleModel.fromJson(Map<String?, dynamic> json) {
    return OrderSaleModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbCustomerId: json['tb_customer_id'],
      nameCustomer: json['name_customer'] as String? ?? "",
      tbUserId: json['tb_user_id'],
      number: json['number'],
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'],
      dtRecord: CustomDate.formatDateIn(json['dt_record']) as String? ?? "",
      totalValue: json['total_value'] is int
          ? json['total_value'].toDouble()
          : json['total_value'],
      changeValue: json['change_value'] is int
          ? json['change_value'].toDouble()
          : json['change_value'],
      note: json['note'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tb_institution_id': tbInstitutionId,
      'tb_customer_id': tbCustomerId,
      'name_customer': nameCustomer,
      'tb_user_id': tbUserId,
      'number': number,
      'tb_salesman_id': tbSalesmanId,
      'name_salesman': nameSalesman,
      'dt_record': CustomDate.newDate(),
      'total_value': totalValue,
      'change_value': changeValue,
      'note': note,
      'status': status
    };
  }
}

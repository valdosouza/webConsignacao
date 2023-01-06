import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_sale_register/domain/entity/order_sale_entity.dart';

class OrderSaleModel extends OrderSaleEntity {
  int id;
  int tbInstitutionId;
  int tbCustomerId;
  String nameCustomer;
  int tbUserIid;
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
    required this.tbUserIid,
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
          tbUserIid: tbUserIid,
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
      id: json['id'] as int? ?? 0,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      tbCustomerId: json['tb_customer_id'] as int? ?? 0,
      nameCustomer: json['name_customer'] as String? ?? "",
      tbUserIid: json['tb_user_id'],
      number: json['number'],
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'],
      dtRecord:
          CustomDate.formatDate(json['dt_record'], "dd/MM/yyyy") as String? ??
              "",
      totalValue: double.parse(json['total_value']),
      changeValue: double.parse(json['change_value']),
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
      'tb_user_id': tbUserIid,
      'number': number,
      'tb_salesman_id': tbSalesmanId,
      'name_salesman': nameSalesman,
      'dt_record': CustomDate.convertDate(dtRecord),
      'total_value': totalValue,
      'change_value': changeValue,
      'note': note,
      'status': status
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:appweb/app/modules/order_bonus_register/domain/entity/order_bonus_register_items_entity.dart';

class OrderBonusRegisterEntity {
  int id;
  int tbInstitutionId;
  int tbOrderid;
  int tbUserId;
  int tbCustomerid;
  String nameCustomer;
  int tbSalesmanId;
  int number;
  String dtRecord;
  String note;
  String status;
  List<OrderBonusRegisterItemsEntity> items;

  OrderBonusRegisterEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbOrderid,
    required this.tbUserId,
    required this.tbCustomerid,
    required this.nameCustomer,
    required this.tbSalesmanId,
    required this.number,
    required this.dtRecord,
    required this.note,
    required this.status,
    required this.items,
  });
}

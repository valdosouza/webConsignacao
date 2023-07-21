// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/entity/order_stock_adjustment_register_items_entity.dart';

class OrderStockAdjustmentRegisterEntity {
 
  int id;
  int tbInstitutionId;
  int tbOrderid;
  int tbUserId;
  int tbEntityid;
  String nameEntity;
  int number;
  String dtRecord;
  String direction;
  String note;
  String status;
  List<OrderStockAdjustmentRegisterItemsEntity> items;

  OrderStockAdjustmentRegisterEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbOrderid,
    required this.tbUserId,
    required this.tbEntityid,
    required this.nameEntity,
    required this.number,
    required this.dtRecord,
    required this.direction,
    required this.note,
    required this.status,
    required this.items,
  });


}

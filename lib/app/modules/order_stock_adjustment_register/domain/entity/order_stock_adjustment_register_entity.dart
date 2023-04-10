import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';

class OrderStockAdjustmentRegisterEntity {
  int id;
  int tbInstitutionId;
  int tbUserId;
  int tbEntityId;
  String nameEntity;
  int number;
  String dtRecord;
  int tbStockListId;
  String nameStockList;
  String note;
  String status;
  List<OrderStockAdjustmentRegisterItemsModel> items;

  OrderStockAdjustmentRegisterEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.tbEntityId,
    required this.nameEntity,
    required this.number,
    required this.dtRecord,
    required this.tbStockListId,
    required this.nameStockList,
    required this.note,
    required this.status,
    required this.items,
  });
}

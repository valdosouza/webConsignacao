import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_register_items_model.dart';

class OrderSaleRegisterEntity {
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
  List<OrderSaleRegisterItemsModel> items;

  OrderSaleRegisterEntity({
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

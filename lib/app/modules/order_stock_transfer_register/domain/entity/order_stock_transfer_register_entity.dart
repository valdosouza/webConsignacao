import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_items_model.dart';

class OrderStockTransferRegisterEntity {
  int id;
  int tbInstitutionId;
  int tbUserId;
  int tbEntityId;
  String nameEntity;
  int number;
  String dtRecord;
  int tbStockListIdOri;
  String nameStockListOri;
  int tbStockListIdDes;
  String nameStockListDes;
  String note;
  String status;
  List<OrderStockTransferRegisterItemsModel> items;

  OrderStockTransferRegisterEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.tbEntityId,
    required this.nameEntity,
    required this.number,
    required this.dtRecord,
    required this.tbStockListIdOri,
    required this.nameStockListOri,
    required this.tbStockListIdDes,
    required this.nameStockListDes,
    required this.note,
    required this.status,
    required this.items,
  });
}

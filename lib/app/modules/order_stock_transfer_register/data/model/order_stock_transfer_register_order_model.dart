// To parse this JSON data, do
//
//     final orderStockTransferRegisterOrderModel = orderStockTransferRegisterOrderModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

OrderStockTransferRegisterOrderModel
    orderStockTransferRegisterOrderModelFromJson(String str) =>
        OrderStockTransferRegisterOrderModel.fromJson(json.decode(str));

String orderStockTransferRegisterOrderModelToJson(
        OrderStockTransferRegisterOrderModel data) =>
    json.encode(data.toJson());

class OrderStockTransferRegisterOrderModel {
  OrderStockTransferRegisterOrderModel({
    required this.order,
    this.items,
  });

  @override
  String toString() => '''
${super.toString()} 
id:${order.id}
tbInstitutionId:${order.tbInstitutionId}
tbUserId:${order.tbUserId}
tbEntityId:${order.tbEntityId}
nameEntity:${order.nameEntity}
tbStockListIdOri:${order.tbStockListIdOri}
nameStockListOri:${order.nameStockListOri}
tbStockListIdDes:${order.tbStockListIdDes}
nameStockListDes:${order.nameStockListDes}
dtRecord:${order.dtRecord}
number:${order.number}
status:${order.status}
note:${order.note}
Items:${items.toString()}
''';

  final Order order;
  final List<Item>? items;

  OrderStockTransferRegisterOrderModel copyWith({
    Order? order,
    List<Item>? items,
  }) =>
      OrderStockTransferRegisterOrderModel(
        order: order ?? this.order,
        items: items ?? this.items,
      );

  factory OrderStockTransferRegisterOrderModel.fromJson(
          Map<String, dynamic> json) =>
      OrderStockTransferRegisterOrderModel(
        order: Order.fromJson(json["Order"]),
        items: json["Items"] != null
            ? List<Item>.from(
                json["Items"].map(
                  (x) => Item.fromJson(x),
                ),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "Order": order.toJson(),
        "Items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toJson()))
            : null,
      };

  static String formatDate(String date, String typeFormat) {
    try {
      initializeDateFormatting('pt_BR,', null);
      DateTime time = DateTime.parse(date);
      return (DateFormat(typeFormat).format(time));
    } catch (e) {
      return "";
    }
  }

  static convertDate(String date) {
    return date.split("/").reversed.join("-");
  }
}

class Item {
  Item({
    required this.id,
    required this.tbInstitutionId,
    required this.tbOrderId,
    required this.tbProductId,
    required this.description,
    required this.quantity,
  });

  @override
  String toString() => '''
${super.toString()} 
id:$id
tbInstitutionId:$tbInstitutionId
tbOrderId:$tbOrderId
tbProductId:$tbProductId
description:$description
quantity:$quantity
''';

  final int id;
  final int tbInstitutionId;
  final int? tbOrderId;
  final int tbProductId;
  final String description;
  final String? quantity;

  Item copyWith({
    int? id,
    int? tbInstitutionId,
    int? tbOrderId,
    int? tbProductId,
    String? description,
    String? quantity,
  }) =>
      Item(
        id: id ?? this.id,
        tbInstitutionId: tbInstitutionId ?? this.tbInstitutionId,
        tbOrderId: tbOrderId ?? this.tbOrderId,
        tbProductId: tbProductId ?? this.tbProductId,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        tbInstitutionId: json["tb_institution_id"],
        tbOrderId: json["tb_order_id"],
        tbProductId: json["tb_product_id"],
        description: json["description"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tb_institution_id": tbInstitutionId,
        "tb_order_id": tbOrderId,
        "tb_product_id": tbProductId,
        "description": description,
        "quantity": quantity,
      };
}

class Order {
  Order({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.tbEntityId,
    required this.nameEntity,
    required this.tbStockListIdOri,
    required this.nameStockListOri,
    required this.tbStockListIdDes,
    required this.nameStockListDes,
    required this.dtRecord,
    required this.number,
    required this.status,
    required this.note,
  });

  int id;
  int tbInstitutionId;
  int tbUserId;
  int tbEntityId;
  String nameEntity;
  int tbStockListIdOri;
  String nameStockListOri;
  int tbStockListIdDes;
  String nameStockListDes;
  DateTime dtRecord;
  int number;
  String status;
  String note;

  Order copyWith({
    int? id,
    int? tbInstitutionId,
    int? tbUserId,
    int? tbEntityId,
    String? nameEntity,
    int? tbStockListIdOri,
    String? nameStockListOri,
    int? tbStockListIdDes,
    String? nameStockListDes,
    DateTime? dtRecord,
    int? number,
    String? status,
    String? note,
  }) =>
      Order(
        id: id ?? this.id,
        tbInstitutionId: tbInstitutionId ?? this.tbInstitutionId,
        tbUserId: tbUserId ?? this.tbUserId,
        tbEntityId: tbEntityId ?? this.tbEntityId,
        nameEntity: nameEntity ?? this.nameEntity,
        tbStockListIdOri: tbStockListIdOri ?? this.tbStockListIdOri,
        nameStockListOri: nameStockListOri ?? this.nameStockListOri,
        tbStockListIdDes: tbStockListIdDes ?? this.tbStockListIdDes,
        nameStockListDes: nameStockListDes ?? this.nameStockListDes,
        dtRecord: dtRecord ?? this.dtRecord,
        number: number ?? this.number,
        status: status ?? this.status,
        note: note ?? this.note,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        tbInstitutionId: json["tb_institution_id"],
        tbUserId: json["tb_user_id"],
        tbEntityId: json["tb_entity_id"],
        nameEntity: json["name_entity"],
        tbStockListIdOri: json["tb_stock_list_id_ori"],
        nameStockListOri: json["name_stock_list_ori"],
        tbStockListIdDes: json["tb_stock_list_id_des"],
        nameStockListDes: json["name_stock_list_des"],
        dtRecord: DateTime.parse(json["dt_record"]),
        number: json["number"],
        status: json["status"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tb_institution_id": tbInstitutionId,
        "tb_user_id": tbUserId,
        "tb_entity_id": tbEntityId,
        "name_entity": nameEntity,
        "tb_stock_list_id_ori": tbStockListIdOri,
        "name_stock_list_ori": nameStockListOri,
        "tb_stock_list_id_des": tbStockListIdDes,
        "name_stock_list_des": nameStockListDes,
        "dt_record":
            "${dtRecord.year.toString().padLeft(4, '0')}-${dtRecord.month.toString().padLeft(2, '0')}-${dtRecord.day.toString().padLeft(2, '0')}",
        "number": number,
        "status": status,
        "note": note,
      };
}

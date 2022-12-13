import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_items_entity.dart';

class OrderAttendanceRegisterItemsModel extends OrderAttendanceRegisterItems {
  OrderAttendanceRegisterItemsModel({
    String? tbProductId,
    String? nameProduct,
    int? bonus,
    int? leftover,
    int? devoluttion,
    int? newConsignment,
    int? qttyConsigned,
  }) : super(
            tbProductId: tbProductId ?? "",
            nameProduct: nameProduct ?? "",
            bonus: bonus ?? 0,
            leftover: leftover ?? 0,
            devoluttion: devoluttion ?? 0,
            newConsignment: newConsignment ?? 0,
            qttyConsigned: qttyConsigned ?? 0);

  factory OrderAttendanceRegisterItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceRegisterItemsModel(
      tbProductId: json['tb_product_id'] as String,
      nameProduct: json['name_product'] as String,
      bonus: json['bonus'],
      leftover: json['leftover'],
      devoluttion: json['devoluttion'],
      newConsignment: json['new_consignment'],
      qttyConsigned: json['qtty_consigned'],
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAttendanceRegisterItemsModel &&
          runtimeType == other.runtimeType &&
          tbProductId == other.tbProductId &&
          nameProduct == other.nameProduct &&
          bonus == other.bonus &&
          leftover == other.leftover &&
          devoluttion == other.devoluttion &&
          newConsignment == other.newConsignment &&
          qttyConsigned == other.qttyConsigned;
          
  @override
  int get hashCode =>
      tbProductId.hashCode ^
      nameProduct.hashCode ^
      bonus.hashCode ^
      leftover.hashCode ^
      devoluttion.hashCode ^
      newConsignment.hashCode ^
      qttyConsigned.hashCode;
          
}

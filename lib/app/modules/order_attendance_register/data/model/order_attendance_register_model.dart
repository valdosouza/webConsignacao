import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';

class OrderAttendanceRegisterModel extends OrderAttendanceRegisterEntity{
  OrderAttendanceRegisterModel({
    int? id,
    int? tbInstitutionId,
    int? tbOrderId,
    int? tbUserId,
    int? tbCustomerId,
    String? nameCustomer,
    int? tbSalesmanId,
    String? nameSalesman,
    String? dtRecord,
    String? note,
    String? status,
    String? visited,
    String? charged,
    String? stage,
    String? latitude,
    String? longitude,
  }):super(
    id: id ?? 0,
    tbInstitutionId: tbInstitutionId ?? 0,
    tbOrderId: tbOrderId ?? 0,
    tbUserId: tbUserId ?? 0,
    tbCustomerId: tbCustomerId ?? 0,
    nameCustomer: nameCustomer ?? "",
    tbSalesmanId: tbSalesmanId ?? 0,
    nameSalesman: nameSalesman ?? "",
    dtRecord: dtRecord ?? "",
    note: note ?? "",
    status: status ?? "",
    visited: visited ?? "",
    charged: charged ?? "",
    stage: stage ?? "",
    latitude: latitude ?? "",
    longitude: longitude ?? "",
  );

  factory OrderAttendanceRegisterModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceRegisterModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbOrderId: json['tb_order_id'],
      tbUserId: json['tb_user_id'],
      tbCustomerId: json['tb_customer_id'],
      nameCustomer: json['name_customer'] as String,
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'] as String,
      dtRecord: json['dt_record'] as String,
      note: json['note'] as String,
      status: json['status'] as String,
      visited: json['visited'] as String,
      charged: json['charged'] as String,
      stage: json['stage'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }

  factory OrderAttendanceRegisterModel.empty() {
    return OrderAttendanceRegisterModel(
      id: 0,
      tbInstitutionId: 0,
      tbOrderId: 0,
      tbUserId: 0,
      tbCustomerId: 0,
      nameCustomer: "",
      tbSalesmanId: 0,
      nameSalesman: "",
      dtRecord: "",
      note: "",
      status: "",
      visited: "",
      charged: "",
      stage: "",
      latitude: "",
      longitude: "",
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderAttendanceRegisterModel &&
        other.id == id &&
        other.tbInstitutionId == tbInstitutionId &&
        other.tbOrderId == tbOrderId &&
        other.tbUserId == tbUserId &&
        other.tbCustomerId == tbCustomerId &&
        other.nameCustomer == nameCustomer &&
        other.tbSalesmanId == tbSalesmanId &&
        other.nameSalesman == nameSalesman &&
        other.dtRecord == dtRecord &&
        other.note == note &&
        other.status == status &&
        other.visited == visited &&
        other.charged == charged &&
        other.stage == stage &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tbInstitutionId.hashCode ^
        tbOrderId.hashCode ^
        tbUserId.hashCode ^
        tbCustomerId.hashCode ^
        nameCustomer.hashCode ^
        tbSalesmanId.hashCode ^
        nameSalesman.hashCode ^
        dtRecord.hashCode ^
        note.hashCode ^
        status.hashCode ^
        visited.hashCode ^
        charged.hashCode ^
        stage.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
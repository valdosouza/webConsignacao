import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';

class OrderAttendanceModel extends OrderAttendanceEntity {
  OrderAttendanceModel({
    required int id,
    required int tbInstitutionId,
    required int tbUserId,
    required int tbCustomerId,
    required String nameCustomer,
    required int tbSalesmanId,
    required String nameSalesman,
    required String dtRecord,
    required String note,
    required String status,
    required String visited,
    required String charged,
    required String latitude,
    required String longitude,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbUserId: tbUserId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          tbSalesmanId: tbSalesmanId,
          nameSalesman: nameSalesman,
          dtRecord: dtRecord,
          note: note,
          status: status,
          visited: visited,
          charged: charged,
          latitude: latitude,
          longitude: longitude,
        );

  factory OrderAttendanceModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbUserId: json['tb_user_id'],
      tbCustomerId: json['tb_customer_id'],
      nameCustomer: json['name_customer'],
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'],
      dtRecord: json['dt_record'],
      note: json['note'],
      status: json['status'],
      visited: json['visited'],
      charged: json['charged'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_user_id'] = tbUserId;
    data['tb_customer_id'] = tbCustomerId;
    data['name_customer'] = nameCustomer;
    data['tb_salesman_id'] = tbSalesmanId;
    data['name_salesman'] = nameSalesman;
    data['dt_record'] = dtRecord;
    data['note'] = note;
    data['status'] = status;
    data['visited'] = visited;
    data['charged'] = charged;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderAttendanceModel &&
        other.id == id &&
        other.tbInstitutionId == tbInstitutionId &&
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
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tbInstitutionId.hashCode ^
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
        latitude.hashCode ^
        longitude.hashCode;
  }
}

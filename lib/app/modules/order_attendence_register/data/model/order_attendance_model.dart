import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/entity/order_attendance_entity.dart';

class OrderAttendanceModel extends OrderAttendanceEntity {
  int id;
  int tbInstitutionId;
  int tbUserId;
  String dtRecord;
  int tbCustomerId;
  String nameCustomer;
  int tbSalesmanId;
  String nameSalesman;
  int tbPriceListId;
  String note;
  String status;
  String visited;
  String charged;
  String recall;
  String finished;
  String longitude;
  String latitude;
  String routeRetorn;
  int tbSalesRouteId = 0;
  String nameSalesRoute = "";
  int tbRegionId = 0;
  String nameRegion = "";

  OrderAttendanceModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.dtRecord,
    required this.tbCustomerId,
    required this.nameCustomer,
    required this.tbSalesmanId,
    required this.nameSalesman,
    required this.tbPriceListId,
    required this.note,
    required this.status,
    required this.visited,
    required this.charged,
    required this.finished,
    required this.recall,
    required this.longitude,
    required this.latitude,
    required this.routeRetorn,
    this.tbSalesRouteId = 0,
    this.nameSalesRoute = "",
    this.tbRegionId = 0,
    this.nameRegion = "",
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbUserId: tbUserId,
          dtRecord: dtRecord,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          tbSalesmanId: tbSalesmanId,
          nameSalesman: nameSalesman,
          tbPriceListId: tbPriceListId,
          note: note,
          status: status,
          visited: visited,
          charged: charged,
          recall: recall,
          finished: finished,
          longitude: longitude,
          latitude: latitude,
          routeRetorn: routeRetorn,
          tbSalesRouteId: tbSalesRouteId,
          nameSalesRoute: nameSalesRoute,
          tbRegionId: tbRegionId,
          nameRegion: nameRegion,
        );

  factory OrderAttendanceModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceModel(
      id: int.parse(json['id'].toString()),
      tbInstitutionId: int.parse(json['tb_institution_id'].toString()),
      tbUserId: int.parse(json['tb_user_id'].toString()),
      dtRecord: json['dt_record'],
      tbCustomerId: int.parse(json['tb_customer_id'].toString()),
      nameCustomer: json['name_customer'],
      tbSalesmanId: int.parse(json['tb_salesman_id'].toString()),
      nameSalesman: json['name_salesman'],
      tbPriceListId: json['tb_price_list_id'] is String
          ? int.parse(json['tb_price_list_id'])
          : json['tb_price_list_id'],
      note: json['note'],
      status: json['status'],
      visited: json['visited'],
      charged: json['charged'],
      recall: json['recall'],
      finished: json['finished'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      routeRetorn: "",
      tbSalesRouteId: 0,
      nameSalesRoute: "",
      tbRegionId: 0,
      nameRegion: "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id.toString();
    data["tb_institution_id"] = tbInstitutionId.toString();
    data["tb_user_id"] = tbUserId.toString();
    data["dt_record"] = CustomDate.formatDateOut(dtRecord);
    data["tb_customer_id"] = tbCustomerId.toString();
    data["name_customer"] = nameCustomer;
    data["tb_salesman_id"] = tbSalesmanId.toString();
    data["name_salesman"] = nameSalesman;
    data['tb_price_list_id'] = tbPriceListId;
    data["note"] = note;
    data["status"] = status;
    data["visited"] = visited;
    data["charged"] = charged;
    data["recall"] = recall;
    data['finished'] = finished;
    data["longitude"] = longitude;
    data["latitude"] = latitude;
    return data;
  }

  factory OrderAttendanceModel.isEmpty() {
    return OrderAttendanceModel(
      id: 0,
      tbInstitutionId: 0,
      tbUserId: 0,
      tbCustomerId: 0,
      nameCustomer: "",
      tbSalesmanId: 0,
      nameSalesman: "",
      tbPriceListId: 0,
      dtRecord: "",
      note: "",
      status: "A",
      visited: "N",
      charged: "N",
      recall: "N",
      finished: "S",
      latitude: "",
      longitude: "",
      routeRetorn: "",
      tbSalesRouteId: 0,
      tbRegionId: 0,
    );
  }
}

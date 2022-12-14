class OrderAttendanceEntity {
  int id;
  int tbInstitutionId;
  int tbUserId;
  int tbCustomerId;
  String nameCustomer;
  int tbSalesmanId;
  String nameSalesman;
  String dtRecord;
  String note;
  String status;
  String visited;
  String charged;
  String latitude;
  String longitude;

  OrderAttendanceEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.tbUserId = 0,
    this.tbCustomerId = 0,
    this.nameCustomer = "",
    this.tbSalesmanId = 0,
    this.nameSalesman = "",
    this.dtRecord = "",
    this.note = "",
    this.status = "",
    this.visited = "",
    this.charged = "",
    this.latitude = "",
    this.longitude = "",
  });

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

  factory OrderAttendanceEntity.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceEntity(
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
}

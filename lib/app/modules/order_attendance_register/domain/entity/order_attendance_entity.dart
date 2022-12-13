class OrderAttendanceRegisterEntity{
  int id;
  int tbInstitutionId;
  int tbOrderId;
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
  String stage;
  String latitude;
  String longitude;

  OrderAttendanceRegisterEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.tbOrderId = 0,
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
    this.stage = "",
    this.latitude = "",
    this.longitude = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderId;
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
    data['stage'] = stage;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

}
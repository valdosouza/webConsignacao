class CustomerEntity {
  int id;
  int tbInstitutionId;
  int tbSalesmanId;
  int tbCarrierId;
  String salesmanName;
  String creditStatus;
  double creditValue;
  String wallet;
  String consumer;
  double multiplier;
  String active;

  CustomerEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.tbSalesmanId = 0,
    this.tbCarrierId = 0,
    this.salesmanName = "",
    this.creditStatus = "",
    this.creditValue = 0,
    this.wallet = "",
    this.consumer = "",
    this.multiplier = 0,
    this.active = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_salesman_id'] = tbSalesmanId;
    data['tb_carrier_id'] = tbCarrierId;
    data['credit_status'] = creditStatus;
    data['salesman_name'] = salesmanName;
    data['credit_value'] = 0;
    data['wallet'] = wallet;
    data['consumer'] = consumer;
    data['multiplier'] = 0;
    data['active'] = active;
    return data;
  }
}

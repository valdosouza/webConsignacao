class CustomerEntity {
  int id;
  int tbInstitutionId;
  int tbSalesmanId;
  String salesmanName;
  int tbCarrierId;
  int tbSalesRouteId;
  String salesRouteName;
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
    this.salesmanName = "",
    this.tbCarrierId = 0,
    this.tbSalesRouteId = 0,
    this.salesRouteName = "",
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
    data['salesman_name'] = salesmanName;
    data['tb_carrier_id'] = tbCarrierId;
    data['tb_sales_route_id'] = tbSalesRouteId;
    data['sales_route_name'] = salesRouteName;
    data['credit_status'] = creditStatus;
    data['credit_value'] = 0;
    data['wallet'] = wallet;
    data['consumer'] = consumer;
    data['multiplier'] = 0;
    data['active'] = active;
    return data;
  }
}

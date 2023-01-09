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
}

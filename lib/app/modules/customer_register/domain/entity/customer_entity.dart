class CustomerEntity {
  int id;
  int tbInstitutionId;
  int tbRegionId;
  String regionName;
  int tbCarrierId;
  int tbSalesRouteId;
  String salesRouteName;
  int tbSalesmanId;
  String creditStatus;
  double creditValue;
  String wallet;
  String consumer;
  double multiplier;
  String active;

  CustomerEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.tbRegionId = 0,
    this.regionName = "",
    this.tbCarrierId = 0,
    this.tbSalesRouteId = 0,
    this.salesRouteName = "",
    this.tbSalesmanId = 0,
    this.creditStatus = "",
    this.creditValue = 0,
    this.wallet = "",
    this.consumer = "",
    this.multiplier = 0,
    this.active = "",
  });
}

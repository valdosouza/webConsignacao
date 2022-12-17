class CustomerListEntity {
  int id;
  String nameCompany;
  String nickTrade;
  String docKind;
  String docNumber;
  int tbSalesRouteIid;
  String nameSalesRoute;
  int sequence;

  CustomerListEntity({
    this.id = 0,
    this.nameCompany = "",
    this.nickTrade = "",
    this.docKind = "",
    this.docNumber = "",
    this.tbSalesRouteIid = 0,
    this.nameSalesRoute = "",
    this.sequence = 0,
  });
}

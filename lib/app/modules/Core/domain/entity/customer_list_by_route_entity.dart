class CustomerListByRouteEntity {
  int id;
  String nameCompany;
  String nickTrade;
  String docKind;
  String docNumber;
  int tbSalesRouteIid;
  String nameSalesRoute;
  int sequence;
  String street;
  String nmbr;
  String complement;
  bool expanded;

  CustomerListByRouteEntity({
    this.id = 0,
    this.nameCompany = "",
    this.nickTrade = "",
    this.docKind = "",
    this.docNumber = "",
    this.tbSalesRouteIid = 0,
    this.nameSalesRoute = "",
    this.sequence = 0,
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.expanded = false,
  });
}

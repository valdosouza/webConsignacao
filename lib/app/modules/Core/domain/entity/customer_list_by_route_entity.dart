class CustomerListByRouteEntity {
  int id;
  String nameCompany;
  String nickTrade;
  String docKind;
  String docNumber;
  int tbSalesRouteId;

  String nameSalesRoute;
  int defaultSeq;
  int sequence;
  String turnBack;
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
    this.tbSalesRouteId = 0,
    this.nameSalesRoute = "",
    this.defaultSeq = 0,
    this.sequence = 0,
    this.turnBack = "N",
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.expanded = false,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderProductionRegisterEntity {
  
  int id;
  int tbInstitutionId;
  int tbUserId;
  String dtRecord;
  int number;
  String status;
  int tbMerchandiseId;
  String nameMerchandise;
  int qttyForecast;
  int tbStockListIdDes;
  String nameStockListDes;
  String note;

  OrderProductionRegisterEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.tbUserId = 0,
    this.dtRecord = "",
    this.number = 0,
    this.status = "",
    this.tbMerchandiseId = 0,
    this.nameMerchandise = "",
    this.qttyForecast = 0,
    this.tbStockListIdDes = 0,
    this.nameStockListDes = "",
    this.note = "",
  });

}

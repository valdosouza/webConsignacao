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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["tb_institution_id"] = tbInstitutionId;
    data["tb_user_id"] = tbUserId;
    data["dt_record"] = dtRecord;
    data["number"] = number;
    data["status"] = status;
    data["tb_merchandise_id"] = tbMerchandiseId;
    data["name_merchandise"] = nameMerchandise;
    data["qtty_forecast"] = qttyForecast;
    data["tb_stock_list_id_des"] = tbStockListIdDes;
    data["name_stock_list_des"] = nameStockListDes;
    data["note"] = note;
    return data;
  }
}

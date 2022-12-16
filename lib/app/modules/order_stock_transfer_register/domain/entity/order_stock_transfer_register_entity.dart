class OrderStockTransferRegisterEntity {
  int id;
  int tbInstitutionId;
  String description;
  String main;
  String active;
  String createdAt;
  String updatedAt;

  OrderStockTransferRegisterEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = '',
    this.main = '',
    this.active = '',
    this.createdAt = '',
    this.updatedAt = '',
  });
}

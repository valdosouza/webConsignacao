class ParamsGetlistStockBalanceEntity {
  int tbInstitutionId;
  int tbSalesmanId;
  int tbStockListId;
  int page;
  int? id;
  String? nameProduct;
  ParamsGetlistStockBalanceEntity({
    required this.tbInstitutionId,
    required this.tbSalesmanId,
    required this.tbStockListId,
    required this.page,
    this.id,
    this.nameProduct,
  });
}

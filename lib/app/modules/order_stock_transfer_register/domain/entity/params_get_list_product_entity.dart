class ParamsGetlistProductEntity {
  int tbInstitutionId;
  int page;
  int? id;
  String? nameProduct;
  ParamsGetlistProductEntity({
    required this.tbInstitutionId,
    required this.page,
    this.id,
    this.nameProduct,
  });
}

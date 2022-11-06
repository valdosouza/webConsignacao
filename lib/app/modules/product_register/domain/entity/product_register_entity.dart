class ProductRegisterEntity {
  int id;
  int tbInstitutionId;
  String description;
  String active;

  ProductRegisterEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = "",
    this.active = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}

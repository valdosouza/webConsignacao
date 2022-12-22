class ProductModel {
  ProductModel({
    required this.id,
    required this.tbInstitutionId,
    required this.description,
    required this.active,
  }) : super();
  final int id;
  final int tbInstitutionId;
  final String description;
  final String active;

  factory ProductModel.fromJson(Map<String?, dynamic> json) {
    return ProductModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String? ?? "",
      active: json['active'] as String? ?? "",
    );
  }
}

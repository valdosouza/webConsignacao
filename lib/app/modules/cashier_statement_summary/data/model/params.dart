class Params {
  int tbInstitutionId;
  String month;
  int year;
  int? tbSalesmanId;
  Params({
    required this.tbInstitutionId,
    required this.month,
    required this.year,
    this.tbSalesmanId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['month'] = month;
    data['year'] = year;
    data['tb_salesman_id'] = tbSalesmanId;
    return data;
  }
}

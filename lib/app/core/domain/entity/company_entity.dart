class CompanyEntity {
  int id;
  String cnpj;
  String ie;
  String iest;
  String dtFoundation;
  String indIeDestinatario;

  CompanyEntity({
    this.id = 0,
    this.cnpj = "",
    this.ie = "",
    this.iest = "",
    this.dtFoundation = "",
    this.indIeDestinatario = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cnpj'] = cnpj;
    data['ie'] = ie;
    data['iest'] = iest;
    data['dt_foundation'] = dtFoundation;
    data['ind_ie_destinatario'] = indIeDestinatario;
    return data;
  }
}

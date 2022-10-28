class CustomerCompanyEntity {
  String cnpj;
  String ie;
  String iest;
  String dtFoundation;
  String indIeDestinatario;

  CustomerCompanyEntity({
    this.cnpj = "",
    this.ie = "",
    this.iest = "",
    this.dtFoundation = "",
    this.indIeDestinatario = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cnpj'] = cnpj;
    data['ie'] = ie;
    data['iest'] = iest;
    data['dt_foundation'] = dtFoundation;
    data['ind_ie_destinatario'] = indIeDestinatario;
    return data;
  }
}

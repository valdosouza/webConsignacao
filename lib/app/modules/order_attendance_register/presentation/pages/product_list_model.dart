class ProductListModel {
  String bonus;
  String desciption;
  String sobra;
  String devolucao;
  String newConsignation;
  String qttyConsignation;

  ProductListModel({
    this.bonus = "",
    this.desciption = "",
    this.sobra = "",
    this.devolucao = "",
    this.newConsignation = "",
    this.qttyConsignation = "",
  });
  /*
  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      bonus: json['id'] as double? ?? 0,
      desciption: json['name_company'] as String? ?? "",
      sobra: json['nick_trade'] as double? ?? 0,
      devolucao: json['docType'] as double? ?? 0,
      newConsignation: json['documento'] as double? ?? 0,
      qttyConsignation: json['qttyConsignation'] as double? ?? 0,
    );
  }
  */
}

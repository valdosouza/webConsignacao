class PaymentListModel {
  String description;
  String value;

  PaymentListModel({
    this.description = "",
    this.value = "",
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

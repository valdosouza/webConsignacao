import 'package:appweb/app/modules/Core/domain/entity/customer_list_entity.dart';

class CustomerListModel extends CustomerListEntity {
  CustomerListModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    String? docType,
    String? documento,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          docKind: docType ?? "",
          docNumber: documento ?? "",
        );

  factory CustomerListModel.fromJson(Map<String, dynamic> json) {
    return CustomerListModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      docType: json['docType'] as String? ?? "",
      documento: json['documento'] as String? ?? "",
    );
  }
}

import 'package:appweb/app/modules/order_stock_transfer_register/domain/entity/params_get_list_product_entity.dart';

class ParamsGetlistProductModel extends ParamsGetlistProductEntity {
  ParamsGetlistProductModel({
    required int tbInstitutionId,
    required int page,
    int? id,
    String? nameProduct,
  }) : super(
          tbInstitutionId: tbInstitutionId,
          page: page,
          id: id ?? 0,
          nameProduct: nameProduct ?? "",
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['page'] = page;
    data['id'] = id;
    data['name_product'] = nameProduct;

    return data;
  }
}

import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/entity/order_load_card_main_entity.dart';

class OrderLoadCardMainModel extends OrderLoadCardMainEntity {
  int id;
  int tbInstitutionId;
  int tbUserId;
  String nameUser;
  String dtRecord;
  List<OrderLoadCardItemsModel> items;

  OrderLoadCardMainModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.nameUser,
    required this.dtRecord,
    required this.items,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbUserId: tbUserId,
          nameUser: nameUser,
          dtRecord: dtRecord,
          items: items,
        );

  factory OrderLoadCardMainModel.fromJson(Map<String, dynamic> json) {
    return OrderLoadCardMainModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbUserId: json['tb_user_id'],
      nameUser: json['name_user'],
      dtRecord: json['dt_record'],
      items: (json['Items'] != null)
          ? (json['Items'] as List)
              .map((e) => OrderLoadCardItemsModel.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_user_id'] = tbUserId;
    data['dt_record'] = CustomDate.formatDateOut(dtRecord);
    data['Items'] = items.map((i) => i.toJson()).toList();

    return data;
  }

  factory OrderLoadCardMainModel.isEmpty() {
    return OrderLoadCardMainModel(
      id: 0,
      tbInstitutionId: 0,
      tbUserId: 0,
      nameUser: "",
      dtRecord: CustomDate.newDate(),
      items: [],
    );
  }
}

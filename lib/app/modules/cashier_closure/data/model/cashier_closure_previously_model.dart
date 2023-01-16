import 'package:appweb/app/modules/cashier_closure/domain/entity/cashier_closure_previously_entity.dart';

class CashierClosurePreviouslyModel extends CashierClosurePreviouslyEntity {
  CashierClosurePreviouslyModel({
    int? id,
    String? dtRecord,
  }) : super(
          id: id ?? 0,
          dtRecord: dtRecord ?? "",
        );

  factory CashierClosurePreviouslyModel.fromJson(Map<String, dynamic> json) {
    return CashierClosurePreviouslyModel(
      id: json['id'],
      dtRecord: json['dt_record'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dt_record'] = dtRecord;
    return data;
  }
}

import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/domain/entity/cashier_status_entity.dart';

class CashierStatusModel extends CashierStatusEntity {
  CashierStatusModel({
    int? tbIinstitutionId,
    int? tbUserId,
    String? dtRecord,
    String? status,
  }) : super(
          tbIinstitutionId: tbIinstitutionId ?? 0,
          tbUserId: tbUserId ?? 0,
          dtRecord: dtRecord ?? "",
          status: status ?? "A",
        );

  factory CashierStatusModel.fromJson(Map<String, dynamic> json) {
    return CashierStatusModel(
      tbIinstitutionId: json['tb_institution_id'],
      tbUserId: json['tb_user_id'],
      dtRecord: CustomDate.formatDateIn(json['dt_record']),
      status: json['status'],
    );
  }
}

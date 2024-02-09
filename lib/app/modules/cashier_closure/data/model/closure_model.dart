import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/domain/entity/closure_entity.dart';

class ClosureModel extends ClosureEntity {
  ClosureModel({
    required super.dtRecord,
    required super.tbInstitutionId,
    required super.tbUserId,
    required super.items,
  });

  factory ClosureModel.fromJson(Map<String, dynamic> json) {
    return ClosureModel(
      dtRecord: CustomDate.formatDateIn(json['dt_record']),
      tbInstitutionId: json['tb_institution_id'],
      tbUserId: json['tb_user_id'],
      items: (json['items'] as List)
          .map((e) => ClosureItemsModel.fromJson(e))
          .toList(),
    );
  }

  factory ClosureModel.isEmpty() {
    return ClosureModel(
      dtRecord: CustomDate.newDate(),
      tbInstitutionId: 0,
      tbUserId: 0,
      items: [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dt_record'] = CustomDate.formatDateOut(dtRecord);
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_user_id'] = tbUserId;
    data['items'] = items.map((v) => v.toJson()).toList();
    return data;
  }
}

class ClosureItemsModel extends ClosureItemsEntity {
  ClosureItemsModel({
    String? description,
    double? tagValue,
    String? kind,
    String? color,
  }) : super(
          description: description ?? "",
          tagValue: tagValue ?? 0.0,
          kind: kind ?? "",
          color: color ?? "black",
        );

  factory ClosureItemsModel.fromJson(Map<String, dynamic> json) {
    return ClosureItemsModel(
      description: json['description'],
      tagValue: json['tag_value'] is int
          ? json['tag_value'].toDouble()
          : json['tag_value'],
      kind: json['kind'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['tag_value'] = tagValue;
    data['kind'] = kind;
    data['color'] = color;
    return data;
  }
}

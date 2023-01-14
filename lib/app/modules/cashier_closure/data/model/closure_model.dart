class ClosureModel {
  String? dtRecord;
  int? tbInstitutionId;
  int? tbUserId;
  List<Items>? items;

  ClosureModel(
      {this.dtRecord, this.tbInstitutionId, this.tbUserId, this.items});

  ClosureModel.fromJson(Map<String, dynamic> json) {
    dtRecord = json['dt_record'];
    tbInstitutionId = json['tb_institution_id'];
    tbUserId = json['tb_user_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dt_record'] = dtRecord;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_user_id'] = tbUserId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? description;
  String? tagValue;
  String? kind;

  Items({this.description, this.tagValue, this.kind});
  int indexSum = 0;

  Items.fromJson(Map<String, dynamic> json) {
    indexSum++;
    description = json['description'];
    tagValue = json['tag_value'];
    kind = json['kind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['tag_value'] = tagValue;
    data['kind'] = kind;
    return data;
  }
}

class CashierClosurePreviously {
  int? id;
  String? dtRecord;

  CashierClosurePreviously({
    this.id,
    this.dtRecord,
  });

  CashierClosurePreviously.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dtRecord = json['dt_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dt_record'] = dtRecord;
    return data;
  }
}

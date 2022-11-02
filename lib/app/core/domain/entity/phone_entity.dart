class PhoneEntity {
  int id;
  String kind;
  String contact;
  String number;
  String addressKind;

  PhoneEntity({
    this.id = 0,
    this.kind = "",
    this.contact = "",
    this.number = "",
    this.addressKind = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kind'] = kind;
    data['contact'] = contact;
    data['number'] = number;
    data['address_kind'] = addressKind;
    return data;
  }
}

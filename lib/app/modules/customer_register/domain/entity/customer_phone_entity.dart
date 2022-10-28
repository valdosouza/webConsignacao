class CustomerPhoneEntity {
  String kind;
  String contact;
  String number;
  String addressKind;

  CustomerPhoneEntity({
    this.kind = "",
    this.contact = "",
    this.number = "",
    this.addressKind = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['contact'] = contact;
    data['number'] = number;
    data['address_kind'] = addressKind;
    return data;
  }
}

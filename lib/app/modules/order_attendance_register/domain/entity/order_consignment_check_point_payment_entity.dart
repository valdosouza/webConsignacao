class OrderConsignmentCheckPointPaymentEntity{
  String description;
  double value;

  OrderConsignmentCheckPointPaymentEntity({
    this.description = '',
    this.value = 0.0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['value'] = value;
    return data;
  }

  factory OrderConsignmentCheckPointPaymentEntity.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentCheckPointPaymentEntity(
      description: json['description'],
      value: json['value'],
    );
  }
}
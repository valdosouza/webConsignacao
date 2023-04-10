class OrderSaleListEntity {
  int id;
  int tbUserId;
  int tbEntityId;
  String nameEntity;
  int number;
  String dtRecord;
  String status;

  OrderSaleListEntity({
    required this.id,
    required this.tbUserId,
    required this.tbEntityId,
    required this.nameEntity,
    required this.number,
    required this.dtRecord,
    required this.status,
  });
}

class OrderConsignmentListEntity {
  int id;
  int tbInstitutionId;
  int tbUserId;
  int tbCustomerId;
  String nameEntity;
  String dtRecord;
  int number;
  String status;
  String note;
  OrderConsignmentListEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.tbCustomerId,
    required this.nameEntity,
    required this.dtRecord,
    required this.number,
    required this.status,
    required this.note,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CashierStatementEntity {
  String description;
  double tagValue;
  String kind;
  String color;

  CashierStatementEntity(
      {required this.description,
      required this.tagValue,
      required this.kind,
      required this.color});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CashierStatementParams {
  int tbInstitutionId;
  String date;
  int? tbCustomerId;
  int tbUserId;
  CashierStatementParams({
    required this.tbInstitutionId,
    required this.date,
    this.tbCustomerId,
    required this.tbUserId,
  }) {
    date = convertDate(date);
  }

  convertDate(String value) {
    return value.split("/").reversed.join("-");
  }
}

class CollaboratorEntity {
  int id;
  int? tbInstitutionId;
  String? dtAdmission;
  String? dtResignation;
  String? active;
  String? salary;
  String? pis;
  String? fathersName;
  String? mothersName;
  String? voteNumber;
  String? voteZone;
  String? voteSection;
  String? militaryCertificate;
  CollaboratorEntity({
    required this.id,
    this.tbInstitutionId,
    this.dtAdmission,
    this.dtResignation,
    this.active,
    this.salary,
    this.pis,
    this.fathersName,
    this.mothersName,
    this.voteNumber,
    this.voteZone,
    this.voteSection,
    this.militaryCertificate,
  });
}

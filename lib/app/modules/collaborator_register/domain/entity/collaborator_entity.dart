class CollaboratorEntity {
  int id;
  int tbInstitutionId;
  String? active;
  String? dtAdmission;
  String? dtResignation;

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
    required this.tbInstitutionId,
    this.active,
    this.dtAdmission,
    this.dtResignation,
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

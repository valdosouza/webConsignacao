import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';

// ignore: must_be_immutable
class CollaboratorModel extends CollaboratorEntity {
  CollaboratorModel({
    required super.id,
    required super.tbInstitutionId,
    required String super.active,
    String? dtAdmission,
    String? dtResignation,
    String? salary,
    String? pis,
    String? fathersName,
    String? mothersName,
    String? voteNumber,
    String? voteZone,
    String? voteSection,
    String? militaryCertificate,
  }) : super(
          dtAdmission: dtAdmission ?? "",
          dtResignation: dtResignation ?? "",
          salary: salary ?? "0.00",
          pis: pis ?? "",
          fathersName: fathersName ?? "",
          mothersName: mothersName ?? "",
          voteNumber: voteNumber ?? "",
          voteZone: voteZone ?? "",
          voteSection: voteSection ?? "",
          militaryCertificate: militaryCertificate ?? "",
        );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['active'] = "S";
    data['dt_admission'] = dtAdmission ?? "";
    data['dt_resignation'] = dtResignation ?? "";
    data['salary'] = "0.00";
    data["pis"] = pis ?? "";
    data['fahters_name'] = fathersName ?? "";
    data['mothers_name'] = mothersName ?? "";
    data['vote_number'] = voteNumber ?? "";
    data['vote_zone'] = voteZone ?? "";
    data['vote_section'] = voteSection ?? "";
    data['military_certificate'] = militaryCertificate ?? "";
    return data;
  }

  factory CollaboratorModel.fromJson(map) {
    return CollaboratorModel(
      id: map['id'],
      tbInstitutionId: map['tb_institution_id'],
      active: map['active'],
      dtAdmission:
          map['dt_admission'] != null ? map['dt_admission'] as String : null,
      dtResignation: map['dt_resignation'] != null
          ? map['dt_resignation'] as String
          : null,
      salary: map['salary'] != null ? map['salary'] as String : null,
      pis: map['pis'] != null ? map['pis'] as String : null,
      fathersName:
          map['fahters_name'] != null ? map['fahters_name'] as String : null,
      mothersName:
          map['mothers_name'] != null ? map['mothers_name'] as String : null,
      voteNumber:
          map['vote_number'] != null ? map['vote_number'] as String : null,
      voteZone: map['vote_zone'] != null ? map['vote_zone'] as String : null,
      voteSection:
          map['vote_section'] != null ? map['vote_section'] as String : null,
      militaryCertificate: map['military_certificate'] != null
          ? map['military_certificate'] as String
          : null,
    );
  }
  factory CollaboratorModel.empty() {
    return CollaboratorModel(
      id: 0,
      tbInstitutionId: 0,
      active: "S",
      dtAdmission: "",
      dtResignation: "",
      fathersName: "",
      mothersName: "",
      militaryCertificate: "",
      pis: "",
      salary: "",
      voteNumber: "",
      voteSection: "",
      voteZone: "",
    );
  }
}

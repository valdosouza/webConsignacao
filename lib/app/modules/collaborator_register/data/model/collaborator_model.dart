import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';

// ignore: must_be_immutable
class CollaboratorModel extends CollaboratorEntity {
  CollaboratorModel({
    int? id,
    int? tbInstitutionId,
    String? dtAdmission,
    String? dtResignation,
    String? active,
    String? salary,
    String? pis,
    String? fathersName,
    String? mothersName,
    String? voteNumber,
    String? voteZone,
    String? voteSection,
    String? militaryCertificate,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          dtAdmission: dtAdmission ?? "",
          dtResignation: dtResignation ?? "",
          active: active ?? "S",
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
    data['tb_institution_id'] = tbInstitutionId ?? 1;
    data['dt_admission'] = dtAdmission ?? "";
    data['dt_resignation'] = dtResignation ?? "";
    data['active'] = "S";
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
      id: map['id'] as int,
      tbInstitutionId: map['tb_institution_id'] != null
          ? map['tb_institution_id'] as int
          : null,
      dtAdmission:
          map['dt_admission'] != null ? map['dt_admission'] as String : null,
      dtResignation: map['dt_resignation'] != null
          ? map['dt_resignation'] as String
          : null,
      active: map['active'] != null ? map['active'] as String : null,
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
      dtAdmission: "",
      dtResignation: "",
      fathersName: "",
      mothersName: "",
      active: "S",
      tbInstitutionId: 0,
      militaryCertificate: "",
      pis: "",
      salary: "",
      voteNumber: "",
      voteSection: "",
      voteZone: "",
    );
  }
}

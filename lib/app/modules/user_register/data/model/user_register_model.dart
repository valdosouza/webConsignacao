import 'package:appweb/app/modules/user_register/domain/entity/user_register_entity.dart';

// ignore: must_be_immutable
class UserRegisterModel extends UserRegisterEntity {
  UserRegisterModel({
    required int id,
    required int tbInstitutionId,
    required String password,
    String kind = "sistema",
    required int tbDeviceId,
    required String active,
    required String email,
    required String nick,
  }) : super(
          id: id,
          password: password,
          kind: kind,
          tbDeviceId: tbDeviceId,
          active: active,
          tbInstitutionId: tbInstitutionId,
          email: email,
          nick: nick,
        );

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      tbInstitutionId: json['tb_institution_id'],
      id: json['id'],
      nick: json['nick'] as String,
      email: json['email'] as String,
      password: "",
      kind: json['kind'] as String,
      tbDeviceId: json['tb_device_id'] as int? ?? 0,
      active: json['active'] as String? ?? "N",
    );
  }
  factory UserRegisterModel.isEmpty() {
    return UserRegisterModel(
      tbInstitutionId: 0,
      id: 0,
      nick: "",
      email: "",
      password: "",
      kind: "",
      tbDeviceId: 0,
      active: "N",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['password'] = password;
    data['kind'] = kind;
    data['tb_device_id'] = 0;
    data['active'] = active;
    data['email'] = email;
    data['nick'] = nick;
    return data;
  }
}

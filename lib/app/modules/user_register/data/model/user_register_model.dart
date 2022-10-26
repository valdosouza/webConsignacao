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
      id: int.parse(json['id'].toString()),
      nick: json['nick'] as String,
      email: json['email'] as String,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 1,
      password: "",
      kind: json['kind'] as String,
      tbDeviceId: json['tb_device_id'] as int? ?? 0,
      active: json['active'] as String? ?? "N",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['tb_institution_id'] = tbInstitutionId.toString();
    data['password'] = password;
    data['kind'] = kind;
    data['tb_device_id'] = 0;
    data['active'] = active;
    data['email'] = email;
    data['nick'] = nick;
    return data;
  }
}

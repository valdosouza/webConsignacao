import 'package:appweb/app/modules/user_register/domain/entity/user_register_entity.dart';

class UserRegisterModel extends UserRegisterEntity {
  UserRegisterModel({
    int? id,
    String? password,
    String kind = "sistema",
    int? tbDeviceId,
    String? active,
    int? institution,
    String? email,
    String? nick,
  }) : super(
          id: id,
          password: password,
          kind: kind,
          tbDeviceId: tbDeviceId,
          active: active,
          institution: institution,
          email: email,
          nick: nick,
        );

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      id: int.parse(json['id'].toString()),
      nick: json['nick'] as String,
      institution: json['tb_institution_id'] as int? ?? 1,
      email: json['email'] as String,
      kind: json['kind'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['Institution'] = institution.toString();
    data['nick'] = nick;
    data['email'] = email;
    data['password'] = password;
    data['kind'] = kind;
    return data;
  }
}

import 'package:appweb/app/modules/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required bool auth,
    required int id,
    required int tbInstitutionId,
    required String username,
    required String password,
    required String jwt,
  }) : super(
          auth: auth,
          id: id,
          tbInstitutionId: tbInstitutionId,
          username: username,
          password: password,
          jwt: jwt,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      auth: json['auth'] as bool,
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      username: json['username'] as String,
      password: json['password'] as String,
      jwt: json['jwt'] as String,
    );
  }
}

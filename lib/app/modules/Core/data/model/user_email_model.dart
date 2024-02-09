import 'package:appweb/app/modules/Core/domain/entity/user_email_entity.dart';

class UserEmailModel extends UserEmailEntity {
  UserEmailModel({
    required super.email,
  });

  factory UserEmailModel.fromJson(Map<String, dynamic> json) {
    return UserEmailModel(
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }

  factory UserEmailModel.empty() {
    return UserEmailModel(
      email: "",
    );
  }
}
